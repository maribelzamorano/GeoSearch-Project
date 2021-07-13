/*	
 * topdev GmbH, erstellt am 09.08.2010 10:34
 *
 * $Author: Maribel Zamorano $
 * $Date: 2010-08-09 10:34:45 $
 * $Rev: _ $
 * -------------------------------------------
 * $Workfile: (010) geoiadm.pss_TemporalGeoIn.sql $
 *
 */

if not exists ( select * from sysobjects where id = object_id('geoiadm.pss_TemporalGeoIn') and OBJECTPROPERTY(id, 'IsProcedure') = 1)
begin
	exec( N'create procedure geoiadm.pss_TemporalGeoIn
	as begin
		print ''Procedure created.'';
	end' );
end
GO

ALTER procedure [geoiadm].[pss_TemporalGeoIn]
	@SESSION_ID				UDT_SESSION_ID,
	@USER					UDT_USER,
-->
	@DEBUG					bit = 0		
as begin


	set nocount on;


	declare	@rc			integer,
			@rc_text	nvarchar(1000),
			@sql_error	integer,
			@procName	nvarchar(250),
			@step		nvarchar(1000),

			@ansc_id	udt_id,
			@geoi_id	udt_id,
			@geoi_user	nvarchar(128),
			@geoi_xpts	nvarchar(23),
			@cc_plz_ort	nvarchar(61),
			@cc_strasse nvarchar(101),


			@Address varchar(100),
			@Country varchar(40),
			@PostalCode varchar(20),
			@Latitude numeric(9, 6),
			@Longitude numeric(9, 6),
			@City varchar(50),
			@xml xml
			

	set @Latitude = null
	set @Longitude = null
		
	set @step = 'Selecting the main address of the registered schools.';	
	if ( @DEBUG = 1 )	print @step;

	DECLARE cur INSENSITIVE CURSOR FOR
		SELECT	geoi.ANSC_ID,CC_PLZ_ORT,CC_STRASSE
		FROM	thillmuser.IO_GESCHAEFTSPARTNER gepa 
		join	thillmuser.IO_DIENSTSTELLE dien 
				on ( dien.GEPA_ID = gepa.GEPA_ID ) 
		join	thillmuser.IO_SCHULTYP schu 
				on ( schu.SCHU_ID = dien.SCHU_ID ) 
		join	thillmuser.V_ANSCHRIFT ansc 
				on ( ansc.GEPA_ID = gepa.GEPA_ID and ANSC_KZ_SERIENBRIEF = 1 )
		join	thillmuser.IO_KREIS krei 
				on ( krei.KREI_ID = dien.KREI_ID ) 
		left outer join thillmuser.IO_GESCHAEFTSPARTNER traeger 
				on ( traeger.GEPA_ID = dien.GEPA_ID_TRAEGER ) 
		join	tspadm.IO_LETZTE_AENDERUNG_MAX sptm 
				on ( sptm.GEPA_ID = gepa.GEPA_ID )
		join	geoiadm.IO_GEOINFORMATION geoi 
				on ( ansc.ANSC_ID = geoi.ANSC_ID ) 
		WHERE GEOI_ISTEMPORARY=1 
		and ISNUMERIC(SUBSTRING(CC_PLZ_ORT,1,5)) <> 0
		and ( gepa.GEPA_KZ_VERALTET = 0 
			and exists( select 1 from tspadm.T_WHITELIST_GEPA 
						where tspadm.T_WHITELIST_GEPA.GEPA_ID = gepa.GEPA_ID ))

	
	BEGIN TRY
		OPEN cur

		while 1 = 1
		begin
			fetch cur into @ansc_id,@cc_plz_ort,@cc_strasse
			if @@fetch_status <0
			break

			set @step = 'Getting longitud and latitude for the given address. ANSC_ID: ' + CONVERT(VARCHAR(50),@ansc_id);	
			if ( @DEBUG = 1 )	print @step;

			select	@Address = @cc_strasse,	@Country = N'DE', @PostalCode = SUBSTRING(@cc_plz_ort,1,5), @City=SUBSTRING(@cc_plz_ort,6,50)
				
			begin try
				exec	[geoiadm].[pss_GetLongLat]
						@Address = @Address output,
						@Country = @Country output,
						@PostalCode = @PostalCode output,
						@GPSLatitude = @Latitude output,
						@GPSLongitude = @Longitude output,
						@City = @City output,
						@xml = @xml output
				
			end try
			begin catch
				select	@rc = -1, @sql_error = ERROR_NUMBER(),
						@rc_text = N'Error on Google Web Service.' + ERROR_MESSAGE();
			end catch

			if ( CONVERT(VARCHAR(max),@xml) = '<GeocodeResponse><status>OVER_QUERY_LIMIT</status></GeocodeResponse>')
			begin
				begin try
					set @step = 'Trying again with 10 seconds delay. ANSC_ID: ' + CONVERT(VARCHAR(50),@ansc_id);	
					if ( @DEBUG = 1 )	print @step
					
					WAITFOR DELAY '000:00:10'
					exec	[geoiadm].[pss_GetLongLat]
							@Address = @Address output,
							@Country = @Country output,
							@PostalCode = @PostalCode output,
							@GPSLatitude = @Latitude output,
							@GPSLongitude = @Longitude output,
							@City = @City output,
							@xml = @xml output
				end try

				begin catch
					select	@rc = -1, @sql_error = ERROR_NUMBER(),
							@rc_text = N'Error on Google Web Service.' + ERROR_MESSAGE();
				end catch
			end
			
			if ( CONVERT(VARCHAR(max),@xml) = '<GeocodeResponse><status>ZERO_RESULTS</status></GeocodeResponse>')
			begin
				set @step = 'Bad entry in database. ANSC_ID: ' + CONVERT(VARCHAR(50),@ansc_id);	
				if ( @DEBUG = 1 )	print @step	
			end

			if @xml IS NULL
			begin
				set @step = 'The Google Web Service did not return anything for the address: ' 
							+ @cc_strasse
							+ ' Postal Code: ' + SUBSTRING(@cc_plz_ort,1,5)
							+ ' City: ' + SUBSTRING(@cc_plz_ort,6,50)
							+ ' ANSC_ID: ' + CONVERT(VARCHAR(50),@ansc_id)
				if ( @DEBUG = 1 )	print @step	
			end 

			if @Longitude IS NOT NULL
			begin
				set @step = 'Updating values with Google. ' + CONVERT(VARCHAR(50),@ansc_id);	
				if ( @DEBUG = 1 )	print @step
				
				select @geoi_id=geoi_id,@geoi_user=geoi_user,@geoi_xpts=geoi_#pts from geoiadm.IO_GEOINFORMATION where ansc_id=@ansc_id

				exec	[geoiadm].[pss_GEOI_IUD]
						@SESSION_ID=@SESSION_ID,
						@USER=@USER,
						@GEOI_ID=@geoi_id,
						@GEOI_USER=@geoi_user,
						@GEOI_XPTS=@geoi_xpts,
						@AAKT_CODE=20,
						@ANSC_ID=@ansc_id,
						@GEOI_LATITUDE=@Latitude,
						@GEOI_LONGITUDE=@Longitude,
						@GEOI_ISTEMPORARY=0,
						@DEBUG=0	
			end

			else
			begin
				set @step = 'Registry was not updated by Google.'+ 'ANSC_ID: ' + CONVERT(VARCHAR(50),@ansc_id)+' Status: ' +  CONVERT(VARCHAR(100),@xml);	
				if ( @DEBUG = 1 )	print @step
			end
				
		end

	END TRY

	BEGIN CATCH
		select	@rc = -1, @sql_error = ERROR_NUMBER(),
				@rc_text = N'Cursor Error.' + ERROR_MESSAGE();

	END CATCH

	DEALLOCATE cur

	if ( @rc <> 0 )
	begin
		if ( isNull( @rc_text, N'' ) = N'' )
			set @rc_text = N'Es ist ein Fehler aufgetreten.';

		set @rc_text = N'(' + @step + '): ' + @rc_text;

		select	@rc_text = services.pfn_getErrorMessageEx( 
					@sql_error,	-- @ERRORNUMBER
					null,		-- @ERRORSEVERITY
					null,		-- @ERRORSTATE
					null,		-- @ERRORLINE
					@procName,	-- @ERRORPROCEDURE
					null,		-- @ERRORMESSAGE
					@rc_text	-- @MSG
				);

		raiserror( @rc_text, 16, 1 );
	end


end

