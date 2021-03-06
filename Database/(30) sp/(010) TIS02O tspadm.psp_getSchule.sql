USE [TIS02O_THILLM_SYST]
GO
/****** Object:  StoredProcedure [tspadm].[psp_getSchule]    Script Date: 09/02/2010 17:45:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

ALTER procedure [tspadm].[psp_getSchule]
	@SESSION_ID	Nvarchar(37),
	@RC		integer			output,
	@SQL_ERROR	integer			output,
	@RC_TEXT	Nvarchar(255)		output,

	@ROWS		bigint			= 20,	-- Zeilen pro Seite
	@PAGE		integer			= 1,	-- Seite im ResultSet, wenn = 0 werden alle Zeilen geliefert (Druck)
	@MAX_CHAR	bigint			= 40,	-- max. Anzahl Zeichen pro Spalte
	@USE_RESULTSET	tinyint			= 0,	-- verwende bestehenden Inhalt in Temp-Tabelle
	@ROWCOUNTER	bigint			output,	-- Gesamtanzahl der gefundenen Zeilen
-- Filterkriterien
	@GEPA_NAME	nvarchar(202)		= null,	-- Schulname
	@DIEN_NR	nvarchar(10)		= null,	-- Schul-Nr., numerisch
	@STRASSE	UDT_STRASSE		= null,	-- der Schule
	@PLZ		UDT_PLZ			= null,	-- der Schule
	@ORT		UDT_ORT			= null,	-- der Schule
	@SCHU_ID	UDT_ID			= null,
	@KREI_ID	UDT_ID			= null,	-- Schulamt
--
	@GEPA_ID_TRAEGER	UDT_ID		= null,
	@SCHULTRAEGER	nvarchar(202)		= null, -- Schultraeger
--
	@USER_LONGITUDE		decimal(8,5)	= null,	-- der Benutzer
	@USER_LATITUDE		decimal(8,5)	= null,	-- der Benutzer
	@RADIUS				float			= null,
	@NUMBER_OF_NEAREST	integer			= null,
--
	@KZ_INSERT	bit			= 0	output,
	@DEBUG		tinyint			=1,

	@SUCHBEGRIFF				nvarchar(1000) = null,
	@SPSS_CODE	UDT_CODE = null 

as begin
	set nocount on

	select	@RC = 0,
		@SQL_ERROR = 0,
		@RC_TEXT = ''

	declare	@object_name	nvarchar(500),
			@table_name		nvarchar(255),
			@table_schema	nvarchar(255),
			@kz_drucken		bit,
			@start			bigint, 
			@stop			bigint

	declare	@sql		Nvarchar(max),
		@from		nvarchar(4000),
		@stmt		nvarchar(4000),
		@parms		nvarchar(300),
		@rowcount	bigint,

		@where		Nvarchar(max),
		@top		bigint,
		@max		bigint,
		@orderby	Nvarchar(1000),

		@kz_browse	bit,
		@kz_edit	bit,
		@kz_delete	bit,
		@subselect		nvarchar(4000),

		@geosql			Nvarchar(max),
		@geoselect		Nvarchar(max),
		@geofrom		Nvarchar(max),
		@geowhere		Nvarchar(max),
		@geogroupby		Nvarchar(max),
		@geoorderby		Nvarchar(max),
		@MaxLongitude	decimal(8,5),
		@MaxLatitude	decimal(8,5),
		@MinLongitude	decimal(8,5),
		@MinLatitude	decimal(8,5),
		@distance		integer,
		@deleteTable	Nvarchar(max)

	select	@sql = N'',
		@where = N'',
		@top = @ROWS * @PAGE,
		@rowcount = 0,

		@KZ_INSERT = 0,
		@kz_browse = 0,
		@kz_edit = 0,
		@kz_delete = 0

-- Umgebung vorbereiten
	
	if @SUCHBEGRIFF = N''				select @SUCHBEGRIFF = null

	if ( @RC = 0 )
	begin
		select	@table_name = 'T#RESULT_GETSCHULE_' + @SESSION_ID, 
				@table_schema = 'thillmuser'

		select	@object_name = @table_schema + N'.' + @table_name
		
		select	@sql =
			N'if not exists( select 1 from INFORMATION_SCHEMA.TABLES where table_schema = ''' + @table_schema + N''' and table_name = ''' + @table_name + N''' )' +
			N'begin ' +
			N' CREATE TABLE ' + @object_name + N'( ' +
			N'	GEPA_ID 	bigint	NOT NULL, ' +
			N'	ROWNUMBER 	bigint	NOT NULL  ' +
			N' ); ' +
			N' create unique index T#RDIEN_IX_01_U on ' + @object_name + N'( GEPA_ID ); ' + 
			N' create unique index T#RDIEN_IX_02_U on ' + @object_name + N'( ROWNUMBER ); ' + 
			N'end'


		if ( @DEBUG = 1 )
		begin
			print	@sql
		end


		BEGIN TRY
			begin transaction

			exec @SQL_ERROR = sp_executesql @sql

			commit transaction;

		END TRY
		BEGIN CATCH
			rollback transaction;

			select	@RC = -1, 
					@RC_TEXT = N'Die Ergebnistabelle "' + @object_name + N'" konnte nicht erstellt werden. 
						' + isnull( ERROR_MESSAGE(), N'...' ) + N' 
						' + N'Objekt: ' + isnull( ERROR_PROCEDURE(), Object_Name( @@PROCID )) + isnull( N' in Zeile ' + convert( nvarchar(18), ERROR_LINE ()), N'' )
		END CATCH
	end

-- Berechtigungen ueberpruefen

	select	@kz_browse = 1,
		@kz_edit = 0

	if ( @kz_browse = 0 )
	begin
		select	@RC = -1,
				@RC = 'Sie haben keine Berechtigung zum Anzeigen der Daten.'
	end

-- Filterkriterien auswerten

	if ( @RC = 0 ) and ( @USE_RESULTSET = 0 )
	begin
		select	@GEPA_NAME = isnull( @GEPA_NAME, N'' )
		if @GEPA_NAME > N''
		begin
			if @where > N''
				select	@where = @where + N' AND '
	
			select	@where = @where + N'( GEPA_#NAME_12 like ''' + thillmuser.pfn_PrepareSearchItem( @GEPA_NAME, 0 ) + ''' )'
		end
	
		select	@DIEN_NR = isnull( @DIEN_NR, N'' )
		if @DIEN_NR > ''
		begin
			if not isnumeric( @DIEN_NR ) = 1
				select	@DIEN_NR = '-1'
	
			if @where > N''
				select	@where = @where + N' AND '
		
			select	@where = @where + N'( DIEN_NR like ''' + thillmuser.pfn_PrepareSearchItem( @DIEN_NR, 0 ) + ''' )'
		end
	
		select	@PLZ = isnull( @PLZ, N'' )
		if @PLZ > N''
		begin
			if @where > N''
				select	@where = @where + N' AND '
	
			select	@where = @where + N'( PLZV_NUMMER like ''' + thillmuser.pfn_PrepareSearchItem( @PLZ, 0 ) + ''' )'
		end
	
		select	@ORT = isnull( @ORT, N'' )
		if @ORT > N''
		begin
			if @where > N''
				select	@where = @where + N' AND '
	
			select	@where = @where + N'( ORTV_NAME like ''' + thillmuser.pfn_PrepareSearchItem( @ORT, 0 ) + ''' )'
		end
	
		select	@STRASSE = isnull( @STRASSE, N'' )
		if @STRASSE > N''
		begin
			if @where > N''
				select	@where = @where + N' AND '
	
			select	@where = @where + N'( STRV_NAME like ''' + thillmuser.pfn_PrepareSearchItem( @STRASSE, 0 ) + ''' )'
		end

		select	@SCHU_ID = isnull( @SCHU_ID, N'' )
		if @SCHU_ID > N''
		begin
			if @where > N''
				select	@where = @where + N' AND '
	
			select	@where = @where + N'( dien.SCHU_ID like ''' + thillmuser.pfn_PrepareSearchItem( @SCHU_ID, 0 ) + ''' )'
		end

		select	@KREI_ID = isnull( @KREI_ID, 0 )
		if @KREI_ID > 0
		begin
			if @where > N''
				select	@where = @where + N' AND '

			select	@where = @where + N'( KREI_ID = ' + convert( nvarchar(18), @KREI_ID ) + ' )'
		end

		select	@GEPA_ID_TRAEGER = isnull( @GEPA_ID_TRAEGER, 0 )
		if @GEPA_ID_TRAEGER > 0
		begin
			if @where > N''
				select	@where = @where + N' AND '
	
			select	@where = @where + N'( GEPA_ID_TRAEGER = ' + convert( nvarchar(18), @GEPA_ID_TRAEGER ) + ' )'
		end

		if ( @SUCHBEGRIFF is not null )
		begin
			exec tspadm.psp_GetScpoSubSelect
				@TBSH_NAME_KURZ	= 'SUCH',
				@TEXT		= @SUCHBEGRIFF,
				@SQL		= @subselect	output
	
			if @subselect is not null
			begin
				if @where > N''
					select	@where = @where + N' and '

				select	@where = @where + @subselect
			end				
		end
	end

-- feststehende Kriterien setzen

	if ( @RC = 0 ) and ( @USE_RESULTSET = 0 )
	begin
		if @where > N''
			select	@where = @where + N' AND '
	
		select	@where = @where + N'( GEPA_KZ_VERALTET = 0 and ' +
					  N'exists( select 1 from tspadm.T_WHITELIST_GEPA where tspadm.T_WHITELIST_GEPA.GEPA_ID = gepa.GEPA_ID ))'
	
		if @where > N''
			select	@where = 'where ' + @where
	end

-- Sortieren
	
	if ( @RC = 0 )
	begin
		select	@orderby = case when @SPSS_CODE = '10' then ' order by gepa.GEPA_#NAME_12'
								when @SPSS_CODE = '20' then ' order by DIEN_NR asc' 
								when @SPSS_CODE = '30' then ' order by sptm.SPTM_PTS desc'
								when @SPSS_CODE = '40' then ' order by SCHU_SORT, SCHU_BEZEICHNUNG_KURZ' 
								when @SPSS_CODE = '50' then ' order by ORTV_NAME asc' 
								else ' order by gepa.GEPA_#NAME_12' end
	end

begin transaction

-- Ergebnis ermitteln und Ausgabe vorbereiten

	if ( @RC = 0 )
	begin
		select	@kz_drucken = 0

		if ( @USE_RESULTSET = 1 )
			select	@kz_drucken = 1
		else if ( @PAGE > 1 ) and ( @USE_RESULTSET = 0 )
			select	@USE_RESULTSET = 1
	end

	if ( @RC = 0 ) and ( @USE_RESULTSET = 0 )
	begin
		select	@from = 'from	thillmuser.IO_GESCHAEFTSPARTNER gepa ' +
					'join	thillmuser.IO_DIENSTSTELLE dien on ( dien.GEPA_ID = gepa.GEPA_ID ) ' +
					'join	thillmuser.IO_SCHULTYP schu on ( schu.SCHU_ID = dien.SCHU_ID ) ' +
					'join	thillmuser.V_ANSCHRIFT ansc on ( ansc.GEPA_ID = gepa.GEPA_ID and ANSC_KZ_SERIENBRIEF = 1 ) ' +
					'join	tspadm.IO_LETZTE_AENDERUNG_MAX sptm on ( sptm.GEPA_ID = gepa.GEPA_ID )'
		-- Resultset bereitstellen

		select	@sql = 
				N'if exists( select 1 from ' + @object_name + N' ) truncate table ' + @object_name + '; ' +
				N'insert into ' + @object_name + N'( GEPA_ID, ROWNUMBER ) ' +
				N'select gepa.GEPA_ID, ROW_NUMBER() OVER ( ' + @orderby + N' ) as ROWNUMBER ' + @from


		select	@sql = @sql + @where + @orderby + N'; select @ROWCOUNTER = @@rowcount;'

		select	@parms = N'@ROWCOUNTER bigint output'

		if @DEBUG = 1	print	isnull( @sql, '<NULL>' )

		BEGIN TRY
			exec sp_executesql @sql,
				@parms,
				@ROWCOUNTER = @ROWCOUNTER output
		END TRY
		BEGIN CATCH
			select	@RC = -1, @SQL_ERROR = ERROR_NUMBER(),
					@RC_TEXT = N'Beim Erstellen des Ergebnisses ist ein Fehler aufgetreten.

					' + isnull( ERROR_MESSAGE(), N'...' ) + N'
					' + N'Objekt: ' + isnull( ERROR_PROCEDURE(), Object_Name( @@PROCID )) + isnull( N' in Zeile ' + convert( nvarchar(18), ERROR_LINE ()), N'' )
		END CATCH

	end

	if ( @RC = 0 ) and ( @USE_RESULTSET = 1 )
	begin
		select	@sql = N'select @ROWCOUNTER = count(*) from ' + @object_name

		BEGIN TRY
			exec sp_executesql @sql,
				N'@ROWCOUNTER bigint output',
				@ROWCOUNTER = @ROWCOUNTER output
		END TRY
		BEGIN CATCH
			select	@RC = -1, @SQL_ERROR = ERROR_NUMBER(),
					@RC_TEXT = N'Beim Ermitteln des Ergebnisanzahl ist ein Fehler aufgetreten.

					' + isnull( ERROR_MESSAGE(), N'...' ) + N'
					' + N'Objekt: ' + isnull( ERROR_PROCEDURE(), Object_Name( @@PROCID )) + isnull( N' in Zeile ' + convert( nvarchar(18), ERROR_LINE ()), N'' )
		END CATCH
	end

	if ( @kz_drucken = 0 )
	begin

		if (@NUMBER_OF_NEAREST IS NOT NULL) or (@RADIUS IS NOT NULL) 
		begin
			select	@start = 1, @stop = @ROWCOUNTER
		end
		else
		begin
			select	@start = ( @ROWS * ( @PAGE - 1 )) + 1,
					@stop = ( @ROWS * @PAGE )
		end
	end
	else
	begin
		select	@start = 1, @stop = @ROWCOUNTER
	end

	if ( @RC = 0 ) and ( @DEBUG = 1 )  AND ( @USER_LONGITUDE is null) AND ( @USER_LATITUDE is null)
	begin
		select	@ROWCOUNTER as ROWCOUNTER, @ROWS as [ROWS], @top as [TOP], 
				@start as [START], @stop as [STOP], @kz_drucken as KZ_PRINT, @RC as RC
	end

	if ( @RC = 0 ) AND ( @ROWCOUNTER > 0 )
	begin
		select	@sql =	'select	@kz_edit as KZ_EDIT, ' +
					'@kz_delete as KZ_DELETE, ' +
					'gepa.GEPA_ID, ' +
					'DIEN_NR as SCHULNUMMER, ' +
					'gepa.GEPA_#NAME_12 as SCHULNAME, ' +
					'SCHU_BEZEICHNUNG_LANG as SCHULART, ' +
					'CC_PLZ_ORT, ' +
					'CC_STRASSE, ' +
					'schu.SCHU_ID, ' +
					'dien.KREI_ID, ' +	
					'traeger.GEPA_#NAME_12 as SCHULTRAEGER, ' +
--					'gepa.GEPA_NAME_1 + '' '' + ORTV_NAME as CC_NAME_1_ORT ',
					'gepa.GEPA_NAME_1 as CC_NAME_1_ORT, ' +
					'sptm.CC_LETZTE_AENDERUNG ' ,
			@from =	'from	thillmuser.IO_GESCHAEFTSPARTNER gepa ' +
				'join	' + @object_name + N' on ( ' + @object_name + '.GEPA_ID = gepa.GEPA_ID ) ' +
				'join	thillmuser.IO_DIENSTSTELLE dien on ( dien.GEPA_ID = gepa.GEPA_ID ) ' +
				'join	thillmuser.IO_SCHULTYP schu on ( schu.SCHU_ID = dien.SCHU_ID ) ' +
				'join	thillmuser.V_ANSCHRIFT ansc on ( ansc.GEPA_ID = gepa.GEPA_ID and ANSC_KZ_SERIENBRIEF = 1 ) ' +
				'join	thillmuser.IO_KREIS krei on ( krei.KREI_ID = dien.KREI_ID ) ' +
				'left outer join thillmuser.IO_GESCHAEFTSPARTNER traeger on ( traeger.GEPA_ID = dien.GEPA_ID_TRAEGER ) ' +
				'join	tspadm.IO_LETZTE_AENDERUNG_MAX sptm on ( sptm.GEPA_ID = gepa.GEPA_ID )',
--			@where = 'where exists( select 1 from ' + @rowsetname + ' where ' + @rowsetname + '.GEPA_ID = gepa.GEPA_ID )',
			@where = 'where ' + @object_name + N'.ROWNUMBER between @start and @stop '

		if ( @USER_LONGITUDE is not null) AND ( @USER_LATITUDE is not null)
		begin 
			exec	[geoiadm].[pss_GetGeoSearchSubSelect]
					@GEOSELECT = @geoselect output,
					@GEOFROM = @geofrom output,
					@GEOWHERE = @geowhere output,
					@GEOGROUPBY = @geogroupby output,
					@GEOORDERBY = @geoorderby output,
					@USER_LONGITUDE = @USER_LONGITUDE,
					@USER_LATITUDE = @USER_LATITUDE,
					@RADIUS = @RADIUS,
					@NUMBER_OF_NEAREST = @NUMBER_OF_NEAREST,
					@DEBUG	= @DEBUG


			select @parms = N'@kz_edit bit, @kz_delete bit, @start bigint, @stop bigint,' + ' ' +
							N'@USER_LONGITUDE decimal(8,5), @USER_LATITUDE decimal(8,5),@MaxLongitude decimal(8,5),' + ' ' +
							N'@MaxLatitude decimal(8,5),@MinLongitude decimal(8,5),@MinLatitude decimal(8,5),@distance integer';

			select	@geosql =  @geoselect + replace(@sql,'select','') +@from + @geofrom + @where + @geowhere +@geogroupby + @geoorderby + replace(@orderby,'order by ','') 

			BEGIN TRY

				exec sp_executesql @geosql, @parms,
					@kz_edit = @kz_edit,
					@kz_delete = @kz_delete,
					@start = @start,
					@stop = @stop,
					@USER_LONGITUDE		= @USER_LONGITUDE,
					@USER_LATITUDE		= @USER_LATITUDE,
					@MaxLongitude	= @MaxLongitude,
					@MaxLatitude	= @MaxLatitude,
					@MinLongitude	= @MinLongitude,
					@MinLatitude	= @MinLatitude,
					@distance		= @distance

			END TRY
			BEGIN CATCH
				select	@RC = -1, @SQL_ERROR = ERROR_NUMBER(),
						@RC_TEXT = N'Beim Bereitstellen des Ergebnisses ist ein Fehler aufgetreten.

						' + isnull( ERROR_MESSAGE(), N'...' ) + N'
						' + N'Objekt: ' + isnull( ERROR_PROCEDURE(), Object_Name( @@PROCID )) + isnull( N' in Zeile ' + convert( nvarchar(18), ERROR_LINE ()), N'' )
			END CATCH
		end
		else
		begin

			select @parms = '@kz_edit bit, @kz_delete bit, @start bigint, @stop bigint'

			select	@sql = @sql + @from + @where + @orderby

			BEGIN TRY
				exec sp_executesql @sql, @parms,
					--@kz_browse = @kz_browse,
					@kz_edit = @kz_edit,
					@kz_delete = @kz_delete,
					--@kz_download = @kz_download,
					--@MAX_CHAR = @MAX_CHAR,
					@start = @start,
					@stop = @stop

			END TRY
			BEGIN CATCH
				select	@RC = -1, @SQL_ERROR = ERROR_NUMBER(),
						@RC_TEXT = N'Beim Bereitstellen des Ergebnisses ist ein Fehler aufgetreten.

						' + isnull( ERROR_MESSAGE(), N'...' ) + N'
						' + N'Objekt: ' + isnull( ERROR_PROCEDURE(), Object_Name( @@PROCID )) + isnull( N' in Zeile ' + convert( nvarchar(18), ERROR_LINE ()), N'' )
			END CATCH
		end

		--print @sql

		if ( @DEBUG = 1 )
		begin
			if ( @USER_LONGITUDE is not null) AND ( @USER_LATITUDE is not null)
			begin 
				print	'GEOSQL= ' + isnull( @geosql, '<null>' )
			end
			else
				print	'SQL= ' + isnull( @sql, '<null>' )
		end

	end
	else
	begin
		select	0 as KZ_EDIT,
			0 as KZ_DELETE,
			null as GEPA_ID,
			null as SCHULNUMMER,
			null as SCHULNAME,
			null as SCHULART,
			null as CC_PLZ_ORT,
			null as CC_STRASSE,
			null as SCHU_ID,
			null as KREI_ID,
			null as SCHULTRAEGER,
			null as CC_NAME_1_ORT,
			null as CC_LETZTE_AENDERUNG
	end

	if ( @RC = 0 )
	begin
		commit transaction
	end
	else
	begin
		rollback transaction
		raiserror( @RC_TEXT, 16, 1 )
	end

	set nocount off
end
