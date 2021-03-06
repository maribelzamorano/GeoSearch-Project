USE [TIS02O_THILLM_SYST]
GO
/****** Object:  StoredProcedure [thillmuser].[psp_Add_ANSC_i]    Script Date: 09/02/2010 17:45:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

ALTER procedure [thillmuser].[psp_Add_ANSC_i]
	@SESSION_ID		Nvarchar(37),		
	@RC			integer			output,
	@SQL_ERROR		integer			output,
	@RC_TEXT		Nvarchar(255)		output,
	-- **
	@@ANSC_ID		UDT_ID		output,
	@@GEPA_ID		UDT_ID,
	@@ANAR_ID		UDT_ID,
	@@STRV_NAME 		UDT_STRASSE,
	@@PLZV_NUMMER		UDT_PLZ,
	@@ORTV_NAME 		UDT_ORT,
	@@ORTV_VORWAHL 		nvarchar(10),
	@@ORTV_NATION		nvarchar(3),
	@@ANSC_HAUSNR		UDT_HAUSNR, 
	@@ANSC_HAUSNRZ		UDT_HAUSNRZ,
	@@ANSC_KZ_SERIENBRIEF	UDT_BOOLEAN,
	@@PERS_ID		UDT_ID,
	@@ANSC_ADRESSZUSATZ	nvarchar(255) = null,
	-- TIS-Online
	@ANSC_USER		UDT_USER,
	@ANSC_XPTS		UDT_#PTS,
	@TRANSACTION		bit = 1,
	@ThrowError		tinyint = 0,
	@ANSC_USER_MODIFIED	UDT_USER = '',
	@GSTA_ID		UDT_ID = 0,

	@DEBUG bit = 0
as begin

	declare	@STRV_ID	UDT_ID,
		@STRV_ID_TEST	UDT_ID,
		@PLZV_ID	UDT_ID,
		@ORTV_ID	UDT_ID,
		@ORTV_#NAME 	UDT_ORT,
		@ORTV_#NATION	nvarchar(3),
		@PLZV_#NUMMER	UDT_PLZ,
		@STRV_#NAME	UDT_STRASSE,
		@KZ_ORTV_NEU	UDT_BOOLEAN,
		@KZ_PLZV_NEU	UDT_BOOLEAN,
		@ANSC_UQID	UDT_UQID,
		@trans		sysname,
		@__UQID		UDT_UQID,
		@ANSC_ID_NEU	UDT_ID,

		@IsNewRegistry	bit
	
		select @ORTV_#NAME = lower( @@ORTV_NAME )
		select @ORTV_#NATION = lower( @@ORTV_NATION )
		select @PLZV_#NUMMER = lower( @@PLZV_NUMMER )
		select @STRV_#NAME = lower( @@STRV_NAME )
	
		if @@ANSC_HAUSNR in ('', '0')	select	@@ANSC_HAUSNR = null
		if @@ANSC_HAUSNRZ = ''	select	@@ANSC_HAUSNRZ = null
	
		select	@SQL_ERROR = 0, @RC = 0

-- Validierung
		if @GSTA_ID is null select @GSTA_ID = 0

		if ( @RC = 0 )
		begin
			if ( isNull( @GSTA_ID, 0 ) > 0 ) and ( @@ANSC_KZ_SERIENBRIEF = 1 )
			begin
				select	@RC = -1, @RC_TEXT = N'Die Anschrift eines Nebenstandortes darf nicht als bevorzugte Anschrift gekennzeichnet werden.'
			end
		end
--

		if ( @RC = 0 ) and ( @TRANSACTION = 1 )
		begin
			select	@trans = 'psp_' + convert( varchar(23), getdate(), 121 )
			begin transaction @trans
		end

-- 	if ( @RC = 0 ) and ( @@ANSC_KZ_SERIENBRIEF = 1 )
-- 	begin
-- 		if exists(
-- 			select	1
-- 			from	thillmuser.T_ANSCHRIFT ansc
-- 			join	thillmuser.T_GESCHAEFTSPARTNER gepa on ( ansc.GEPA_ID = gepa.GEPA_ID )
-- 			where	ansc.ANSC_ID = @@ANSC_ID
-- 			and	gepa.GPAR_CODE in ( 10, 101, 102 )
-- 			)
-- 		begin
-- 			select	PERS_ID, MAND_ID, EIGE_ID, GEPA_ID, PERS_KZ_EXTERN, PERS_PERSONALNUMMER,
-- 				DIBE_ID, DIEN_ID, PERS_GEBURTSJAHR, GESC_CODE, PERS_TITEL, PERS_KZ_THILLMMITARBEITER,
-- 				PERS_KZ_BENUTZERTHILLMPROJEKT, PERS_KZ_RECHTSACHLICH, PERS_KZ_MITARBEITERFREIERTR,
-- 				PERS_KZ_TEILNAHMEBEAMTENFORTB, PERS_DT_URKUNDEGESCHRIEBEN, PERS_DT_URKUNDEVERSCHICKT,
-- 				PERS_LOGINID, QSPF_ID, PERS_KZ_DOZENT, PERS_HONORAR_PRO_STUNDE, PERS_UNTERSCHRIFT, PERS_PTS,
-- 				PERS_USER, PERS_BEMERKUNG_WEITERBILDUNG, PERS_KZ_WEITERBILDUNG_SPF, PERS_REDA_REFERENZEN,
-- 				PERS_KZ_PRIV_ADR_OEFFENTLICH, ANSC_ID_DIEN, PERS_#PTS, PERS_ID_INT, PERS_KZ_REPLIKATION,
-- 				PERS_KZ_FREIGABE
-- 			into	#person
-- 			from	thillmuser.T_PERSON
-- 			where	ANSC_ID_DIEN = (	select	ANSC_ID
-- 							from	thillmuser.T_ANSCHRIFT
-- 							where	GEPA_ID = @@GEPA_ID
-- 							and	ANSC_ID <> @@ANSC_ID
-- 							and	ANSC_KZ_SERIENBRIEF = 1
-- 						)
-- 
-- 			select	@SQL_ERROR = @@error
-- 			if @SQL_ERROR = 0
-- 			begin
-- 				update	#person
-- 				set	ANSC_ID_DIEN = @@ANSC_ID,
-- 					PERS_USER = @ANSC_USER_MODIFIED
-- 
-- 				select	@SQL_ERROR = @@error
-- 			end
-- 
-- 			if @SQL_ERROR = 0
-- 			begin
-- 				delete from thillmuser.T_PERSON where PERS_ID in ( select PERS_ID from #person )
-- 				select @SQL_ERROR = @@error
-- 			end
-- 
-- 			if @SQL_ERROR = 0
-- 			begin
-- 				insert into thillmuser.T_PERSON(
-- 					PERS_ID, MAND_ID, EIGE_ID, GEPA_ID, PERS_KZ_EXTERN, PERS_PERSONALNUMMER,
-- 					DIBE_ID, DIEN_ID, PERS_GEBURTSJAHR, GESC_CODE, PERS_TITEL, PERS_KZ_THILLMMITARBEITER,
-- 					PERS_KZ_BENUTZERTHILLMPROJEKT, PERS_KZ_RECHTSACHLICH, PERS_KZ_MITARBEITERFREIERTR,
-- 					PERS_KZ_TEILNAHMEBEAMTENFORTB, PERS_DT_URKUNDEGESCHRIEBEN, PERS_DT_URKUNDEVERSCHICKT,
-- 					PERS_LOGINID, QSPF_ID, PERS_KZ_DOZENT, PERS_HONORAR_PRO_STUNDE, PERS_UNTERSCHRIFT, PERS_PTS,
-- 					PERS_USER, PERS_BEMERKUNG_WEITERBILDUNG, PERS_KZ_WEITERBILDUNG_SPF, PERS_REDA_REFERENZEN,
-- 					PERS_KZ_PRIV_ADR_OEFFENTLICH, ANSC_ID_DIEN, PERS_#PTS, PERS_ID_INT, PERS_KZ_REPLIKATION,
-- 					PERS_KZ_FREIGABE )
-- 				select	PERS_ID, MAND_ID, EIGE_ID, GEPA_ID, PERS_KZ_EXTERN, PERS_PERSONALNUMMER,
-- 					DIBE_ID, DIEN_ID, PERS_GEBURTSJAHR, GESC_CODE, PERS_TITEL, PERS_KZ_THILLMMITARBEITER,
-- 					PERS_KZ_BENUTZERTHILLMPROJEKT, PERS_KZ_RECHTSACHLICH, PERS_KZ_MITARBEITERFREIERTR,
-- 					PERS_KZ_TEILNAHMEBEAMTENFORTB, PERS_DT_URKUNDEGESCHRIEBEN, PERS_DT_URKUNDEVERSCHICKT,
-- 					PERS_LOGINID, QSPF_ID, PERS_KZ_DOZENT, PERS_HONORAR_PRO_STUNDE, PERS_UNTERSCHRIFT, PERS_PTS,
-- 					PERS_USER, PERS_BEMERKUNG_WEITERBILDUNG, PERS_KZ_WEITERBILDUNG_SPF, PERS_REDA_REFERENZEN,
-- 					PERS_KZ_PRIV_ADR_OEFFENTLICH, ANSC_ID_DIEN, PERS_#PTS, PERS_ID_INT, PERS_KZ_REPLIKATION,
-- 					PERS_KZ_FREIGABE
-- 				from	#person
-- 
-- 				select	@SQL_ERROR = @@error
-- 			end
-- 
-- 			drop table #person
-- 
-- 			if @SQL_ERROR <> 0
-- 			begin
-- 				select	@RC_TEXT = dbo.pfn_GetErrorMessage('0010047', '', '') + '(T_PERSON)'
-- 
-- 				if ( @TRANSACTION = 1 )
-- 				begin
-- 					if @ThrowError = 1
-- 						raiserror( @RC_TEXT, 16, 1 )
-- 
-- 					rollback transaction @trans
-- 				end
-- 
-- 				select @@ANSC_ID = null
-- 				return
-- 			end
-- 
-- 			-- **
-- 		end
--
-- 		if ( isnull( @@ANSC_ID, 0 ) > 0 )
-- 		begin
-- 			if exists( select * from thillmuser.T_ANSCHRIFT where gepa_id = @@GEPA_ID and ansc_id <> @@ANSC_ID and ansc_kz_serienbrief = 1 )
-- 			begin
-- 				select	ANSC_ID, MAND_ID, EIGE_ID, GEPA_ID, ANAR_ID, STRV_ID, ANSC_HAUSNR, ANSC_HAUSNRZ,
-- 					PERS_ID, ANSC_KZ_SERIENBRIEF, ANSC_PTS, ANSC_USER, ANSC_#HAUSNRZ, ANSC_ADRESSZUSATZ,
-- 					ANSC_#PTS, ANSC_ID_INT, ANSC_KZ_REPLIKATION, ANSC_KZ_FREIGABE
-- 				into	#anschrift
-- 				from	thillmuser.T_ANSCHRIFT
-- 				where 	gepa_id = @@GEPA_ID and ansc_id <> @@ANSC_ID
-- 
-- 				select	@SQL_ERROR = @@error
-- 
-- 				if @SQL_ERROR = 0
-- 				begin
-- 					update	#anschrift
-- 					set	ansc_kz_serienbrief = 0,
-- 						ansc_user = @ansc_user_modified
-- 
-- 					select	@SQL_ERROR = @@error
-- 				end
-- 
-- 				if @SQL_ERROR = 0
-- 				begin
-- 					delete from thillmuser.T_ANSCHRIFT where ANSC_ID in ( select ANSC_ID from #anschrift )
-- 					select @SQL_ERROR = @@error
-- 				end
-- 
-- 				if @SQL_ERROR = 0
-- 				begin
-- 					insert into thillmuser.T_ANSCHRIFT(
-- 						ANSC_ID, MAND_ID, EIGE_ID, GEPA_ID, ANAR_ID, STRV_ID, ANSC_HAUSNR, ANSC_HAUSNRZ,
-- 						PERS_ID, ANSC_KZ_SERIENBRIEF, ANSC_PTS, ANSC_USER, ANSC_#HAUSNRZ, ANSC_ADRESSZUSATZ,
-- 						ANSC_#PTS, ANSC_ID_INT, ANSC_KZ_REPLIKATION, ANSC_KZ_FREIGABE )
-- 					select	ANSC_ID, MAND_ID, EIGE_ID, GEPA_ID, ANAR_ID, STRV_ID, ANSC_HAUSNR, ANSC_HAUSNRZ,
-- 						PERS_ID, ANSC_KZ_SERIENBRIEF, ANSC_PTS, ANSC_USER, ANSC_#HAUSNRZ, ANSC_ADRESSZUSATZ,
-- 						ANSC_#PTS, ANSC_ID_INT, ANSC_KZ_REPLIKATION, ANSC_KZ_FREIGABE
-- 					from	#anschrift
-- 
-- 					select	@SQL_ERROR = @@error
-- 				end
-- 
-- 				drop table #anschrift
-- 
-- 				if @SQL_ERROR <> 0
-- 				begin
-- 					select	@RC_TEXT = dbo.pfn_GetErrorMessage('0010047', '', '') + '(T_ANSCHRIFT)'
-- 
-- 					if ( @TRANSACTION = 1 )
-- 					begin
-- 						if @ThrowError = 1
-- 							raiserror( @RC_TEXT, 16, 1 )
-- 
-- 						rollback transaction @trans
-- 					end
-- 
-- 					select @@ANSC_ID = null
-- 					return
-- 				end
-- 
-- 				-- **
-- 			end
--		end
-- 		else if exists( select * from thillmuser.T_ANSCHRIFT where gepa_id = @@GEPA_ID and ansc_kz_serienbrief = 1 )
-- 		begin
-- 			select	ANSC_ID, MAND_ID, EIGE_ID, GEPA_ID, ANAR_ID, STRV_ID, ANSC_HAUSNR, ANSC_HAUSNRZ,
-- 				PERS_ID, ANSC_KZ_SERIENBRIEF, ANSC_PTS, ANSC_USER, ANSC_#HAUSNRZ, ANSC_ADRESSZUSATZ,
-- 				ANSC_#PTS, ANSC_ID_INT, ANSC_KZ_REPLIKATION, ANSC_KZ_FREIGABE
-- 			into	#anschrift2
-- 			from	thillmuser.T_ANSCHRIFT
-- 			where 	gepa_id = @@GEPA_ID
-- 
-- 			select	@SQL_ERROR = @@error
-- 
-- 			if @SQL_ERROR = 0
-- 			begin
-- 				update	#anschrift2
-- 				set	ansc_kz_serienbrief = 0,
-- 					ansc_user = @ansc_user_modified
-- 
-- 				select	@SQL_ERROR = @@error
-- 			end
-- 
-- 			if @SQL_ERROR = 0
-- 			begin
-- 				delete from thillmuser.T_ANSCHRIFT where ANSC_ID in ( select ANSC_ID from #anschrift2 )
-- 				select @SQL_ERROR = @@error
-- 			end
-- 
-- 			if @SQL_ERROR = 0
-- 			begin
-- 				insert into thillmuser.T_ANSCHRIFT(
-- 					ANSC_ID, MAND_ID, EIGE_ID, GEPA_ID, ANAR_ID, STRV_ID, ANSC_HAUSNR, ANSC_HAUSNRZ,
-- 					PERS_ID, ANSC_KZ_SERIENBRIEF, ANSC_PTS, ANSC_USER, ANSC_#HAUSNRZ, ANSC_ADRESSZUSATZ,
-- 					ANSC_#PTS, ANSC_ID_INT, ANSC_KZ_REPLIKATION, ANSC_KZ_FREIGABE )
-- 				select	ANSC_ID, MAND_ID, EIGE_ID, GEPA_ID, ANAR_ID, STRV_ID, ANSC_HAUSNR, ANSC_HAUSNRZ,
-- 					PERS_ID, ANSC_KZ_SERIENBRIEF, ANSC_PTS, ANSC_USER, ANSC_#HAUSNRZ, ANSC_ADRESSZUSATZ,
-- 					ANSC_#PTS, ANSC_ID_INT, ANSC_KZ_REPLIKATION, ANSC_KZ_FREIGABE
-- 				from	#anschrift2
-- 
-- 				select	@SQL_ERROR = @@error
-- 			end
-- 
-- 			drop table #anschrift2
-- 
-- 			if @SQL_ERROR <> 0
-- 			begin
-- 				select	@RC_TEXT = dbo.pfn_GetErrorMessage('0010047', '', '') + '(T_ANSCHRIFT - KZ_SERIENBRIEF)'
-- 
-- 				if ( @TRANSACTION = 1 )
-- 				begin
-- 					if @ThrowError = 1
-- 							raiserror( @RC_TEXT, 16, 1 )
-- 
-- 					rollback transaction @trans
-- 				end
-- 
-- 				select @@ANSC_ID = null
-- 				return
-- 			end
-- 
-- 			-- **
-- 		end
--  	end
-- 	else if ( @RC = 0 )
-- 	begin
-- 		if ( @@ANSC_ID is not null ) AND ( @@ANSC_ID > 0 )
-- 		begin
-- 			if not exists( select * from thillmuser.T_ANSCHRIFT where gepa_id = @@GEPA_ID and ansc_id <> @@ANSC_ID and ansc_kz_serienbrief = 1 )
-- 				select	@@ANSC_KZ_SERIENBRIEF = 1
-- 		end
-- 		else if not exists( select * from thillmuser.T_ANSCHRIFT where gepa_id = @@GEPA_ID and ansc_kz_serienbrief = 1 )
-- 		begin
-- 			select	@@ANSC_KZ_SERIENBRIEF = 1
-- 		end
-- 	end

	if ( @RC = 0 ) and ( @STRV_ID is not null )
	begin
		select	@STRV_ID_TEST =	strv.strv_id
		from	thillmuser.t_strasse strv, thillmuser.t_plz plzv, thillmuser.t_ort ortv
		where	strv.plzv_id = plzv.plzv_id and plzv.ortv_id = ortv.ortv_id
		and	strv.strv_#name = @STRV_#NAME
		and	plzv.plzv_#nummer = @PLZV_#NUMMER
		and	ortv.ortv_#name = @ORTV_#NAME and ortv.ortv_#nation = @ORTV_#NATION

		if ( @STRV_ID_TEST is null )
			select @STRV_ID = null
		else
			select @STRV_ID = @STRV_ID_TEST
	end

	if ( @RC = 0 ) and ( @STRV_ID is null )
	begin
		if ( @@ORTV_NATION is null or @@ORTV_NATION = '')
		begin
			select @@ORTV_NATION = 'D'
			select @ORTV_#NATION = lower( @@ORTV_NATION )
		end

		if ( @@STRV_NAME is null ) or ( @@PLZV_NUMMER is null ) or ( @@ORTV_NAME is null )
		begin
			select	@RC_TEXT = dbo.pfn_GetErrorMessage('0010046', '', '')

			if ( @TRANSACTION = 1 )
			begin
				if @ThrowError = 1
					raiserror( @RC_TEXT, 11, 1 )

				rollback transaction @trans
			end

			select @@ANSC_ID = null
			return
		end

		select @ORTV_ID = ortv_id from thillmuser.t_ort where ortv_#name = @ORTV_#NAME and ortv_nation = @ORTV_#NATION
		if ( @@ERROR <> 0 ) or ( @ORTV_ID is null )
		begin
			select	@__UQID = NewID()
			-- TIS-Online
			execute	thillmuser.psp_GetIdentity
				@TBSH_SHORTNAME = 'ORTV',
				@IDEN_VALUE = @ORTV_ID output
			-- Ebenso die nachfolgende Verwendung von ORTV_ID beim Insert, in TIS-Classic
			-- ist ORTV_ID eine IDENTITY-Spalte
			-- **

			insert into thillmuser.T_ORT( ORTV_ID, ORTV_ID_INT, ORTV_NAME, ORTV_NATION, ORTV_UQID, ORTV_USER ) 
			values( @ORTV_ID, @ORTV_ID, @@ORTV_NAME, @@ORTV_NATION, @__UQID, @ANSC_USER_MODIFIED )

			if ( @@ERROR = 0 )
			begin
				-- TIS-Online
				-- select @ORTV_ID = ORTV_ID from thillmuser.T_ORT where ORTV_UQID = @__UQID
				select @KZ_ORTV_NEU = 1
			end
			else
			begin
				select	@RC_TEXT = dbo.pfn_GetErrorMessage('0010047', '', '')

				if ( @TRANSACTION = 1 )
				begin
					if @ThrowError = 1
						raiserror( @RC_TEXT, 16, 1 )

					rollback transaction @trans
				end

				select @@ANSC_ID = null
				return
			end
		end
		else
		begin
			select @KZ_ORTV_NEU = 0
		end

		if ( @KZ_ORTV_NEU = 0 )
		begin
			select @PLZV_ID = plzv_id from thillmuser.t_plz where ortv_id = @ORTV_ID and plzv_#nummer = @PLZV_#NUMMER
			if ( @@ERROR <> 0 ) or ( @PLZV_ID is null )
			begin
				select @KZ_ORTV_NEU = 1
			end
		end

		if ( @KZ_ORTV_NEU = 1 )
		begin
			select	@__UQID = NewID()
			-- TIS-Online
			execute	thillmuser.psp_GetIdentity
				@TBSH_SHORTNAME = 'PLZV',
				@IDEN_VALUE = @PLZV_ID output
			-- Ebenso die nachfolgende Verwendung von PLZV_ID beim Insert, in TIS-Classic
			-- ist PLZV_ID eine IDENTITY-Spalte
			-- **

			insert into thillmuser.T_PLZ( PLZV_ID, PLZV_ID_INT, ORTV_ID, PLZV_NUMMER, PLZV_UQID, PLZV_USER ) 
			values( @PLZV_ID, @PLZV_ID, @ORTV_ID, @@PLZV_NUMMER, @__UQID, @ANSC_USER_MODIFIED )

			if ( @@ERROR = 0 )
			begin
				-- TIS-Online
				-- select @PLZV_ID = PLZV_ID from thillmuser.T_PLZ where PLZV_UQID = @__UQID
				select @KZ_PLZV_NEU = 1
			end
			else
			begin
				select	@RC_TEXT = dbo.pfn_GetErrorMessage('0010048', '', '')

				if ( @TRANSACTION = 1 )
				begin
					if @ThrowError = 1
						raiserror( @RC_TEXT, 16, 1 )

					rollback transaction @trans
				end

				select @@ANSC_ID = null
				return
			end
		end
		else
		begin
			select @KZ_PLZV_NEU = 0
		end

		if ( @KZ_PLZV_NEU = 0 )
		begin
			select @STRV_ID = strv_id from thillmuser.t_strasse where plzv_id = @PLZV_ID and strv_#name = @STRV_#NAME
			if ( @@ERROR <> 0 ) or ( @STRV_ID is null )
			begin
				select @KZ_PLZV_NEU = 1
			end
		end

		if ( @KZ_PLZV_NEU = 1 )
		begin
			select	@__UQID = NewID()
			-- TIS-Online
			execute	thillmuser.psp_GetIdentity
				@TBSH_SHORTNAME = 'STRV',
				@IDEN_VALUE = @STRV_ID output
			-- Ebenso die nachfolgende Verwendung von STRV_ID beim Insert, in TIS-Classic
			-- ist STRV_ID eine IDENTITY-Spalte
			-- **

			insert into thillmuser.T_STRASSE( STRV_ID, STRV_ID_INT, PLZV_ID, STRV_NAME, STRV_UQID, STRV_USER ) 
			values( @STRV_ID, @STRV_ID, @PLZV_ID, @@STRV_NAME, @__UQID, @ANSC_USER_MODIFIED )

			-- TIS-Online
			-- if ( @@ERROR = 0 )
			-- begin
			--	select @STRV_ID = STRV_ID from thillmuser.T_STRASSE where STRV_UQID = @__UQID
			-- end
			-- else
			if ( @@ERROR <> 0 )
			begin
				select	@RC_TEXT = dbo.pfn_GetErrorMessage('0010049', '', '')

				if ( @TRANSACTION = 1 )
				begin
					if @ThrowError = 1
						raiserror( @RC_TEXT, 16, 1 )

					rollback transaction @trans
				end

				select @@ANSC_ID = null
				return
			end
		end
	end

	if ( @RC = 0 ) and ( @STRV_ID is null )
	begin
		select	@RC_TEXT = dbo.pfn_GetErrorMessage('0010050', '', '')

		if ( @TRANSACTION = 1 )
		begin
			if @ThrowError = 1
				raiserror( @RC_TEXT, 16, 1 )

			rollback transaction @trans
		end

		select @@ANSC_ID = null
		return
	end

	if ( @RC = 0 ) and ( @@ANSC_ID is null ) or ( @@ANSC_ID = 0 )
	begin
		select	@ANSC_UQID = NewID()

		execute	thillmuser.psp_GetIdentity
			@TBSH_SHORTNAME = 'ANSC',
			@IDEN_VALUE = @@ANSC_ID output

		insert into thillmuser.T_ANSCHRIFT(
			ANSC_ID, ANSC_ID_INT, GEPA_ID, ANAR_ID, STRV_ID, ANSC_HAUSNR, ANSC_HAUSNRZ, PERS_ID, ANSC_KZ_SERIENBRIEF, ANSC_ADRESSZUSATZ, ANSC_UQID, ANSC_USER, GSTA_ID )
		values(	@@ANSC_ID, @@ANSC_ID, @@GEPA_ID, @@ANAR_ID, @STRV_ID, @@ANSC_HAUSNR, @@ANSC_HAUSNRZ, @@PERS_ID, @@ANSC_KZ_SERIENBRIEF, @@ANSC_ADRESSZUSATZ, @ANSC_UQID, @ANSC_USER_MODIFIED, @GSTA_ID )

		--GeoSearch
		if ( @@ANSC_KZ_SERIENBRIEF = 1 )
		begin
			Set @IsNewRegistry = 1;
			begin try
				exec	[geoiadm].[pss_GetNewGeoInformation]
						@SESSION_ID			= @SESSION_ID,
						@ANSC_USER_MODIFIED = @ANSC_USER_MODIFIED,
						@ANSC_ID			= @@ANSC_ID,
						@ISNEWREGISTRY		= @IsNewRegistry,
						@DEBUG				= @DEBUG
				
			end try
			begin catch
				select	@rc_text = N'Error on pss_GetNewGeoInformation while inserting in geoiadm.IO_GEOINFORMATION.' + ERROR_MESSAGE();
			end catch
		end

		if ( @@ERROR <> 0 )
		begin
			select	@RC_TEXT = dbo.pfn_GetErrorMessage('0010051', '', '')
			if ( @TRANSACTION = 1 )
			begin
				if @ThrowError = 1
					raiserror( @RC_TEXT, 16, 1 )
				rollback transaction @trans
			end

			select @@ANSC_ID = null
			return
		end
	end
	else if ( @RC = 0 )
	begin

		if not exists(	select	1
				from	thillmuser.T_ANSCHRIFT
				where	ANSC_ID = @@ANSC_ID
				and	ANSC_USER = @ANSC_USER
				and	ANSC_#PTS = @ANSC_XPTS )
		begin
			select	@RC = -1,
				@RC_TEXT = dbo.pfn_GetErrorMessage('0020015', '', '')
		end
		else
			select	@RC = 0

		if ( @RC = 0 )
		begin
			select	ANSC_ID, MAND_ID, EIGE_ID, GEPA_ID, ANAR_ID, STRV_ID, ANSC_HAUSNR, ANSC_HAUSNRZ,
				PERS_ID, ANSC_KZ_SERIENBRIEF, ANSC_PTS, ANSC_USER, ANSC_#HAUSNRZ, ANSC_ADRESSZUSATZ,
				ANSC_#PTS, ANSC_ID_INT, ANSC_KZ_REPLIKATION, ANSC_KZ_FREIGABE, ANSC_ID_REFERENZ, GSTA_ID
			into	#anschrift3
			from	thillmuser.T_ANSCHRIFT
			where 	ansc_id = @@ANSC_ID
	
			select	@SQL_ERROR = @@error
		end

		if ( @RC = 0 ) and ( @SQL_ERROR = 0 )
		begin
			update #anschrift3 set 
				GEPA_ID = @@GEPA_ID,
				ANAR_ID = @@ANAR_ID,
				STRV_ID = @STRV_ID,
				ANSC_HAUSNR = @@ANSC_HAUSNR,
				ANSC_HAUSNRZ = @@ANSC_HAUSNRZ,
				PERS_ID = @@PERS_ID,
				ANSC_KZ_SERIENBRIEF = @@ANSC_KZ_SERIENBRIEF,
				ANSC_ADRESSZUSATZ = @@ANSC_ADRESSZUSATZ,
				ANSC_USER = @ANSC_USER_MODIFIED,
				GSTA_ID	= @GSTA_ID

			select	@SQL_ERROR = @@error
		end

		if ( @RC = 0 ) and ( @SQL_ERROR = 0 )
		begin
			delete from thillmuser.T_ANSCHRIFT where ANSC_ID = @@ANSC_ID
			select @SQL_ERROR = @@error
		end

		if ( @RC = 0 ) and ( @SQL_ERROR = 0 )
		begin
			insert into thillmuser.T_ANSCHRIFT(
				ANSC_ID, MAND_ID, EIGE_ID, GEPA_ID, ANAR_ID, STRV_ID, ANSC_HAUSNR, ANSC_HAUSNRZ,
				PERS_ID, ANSC_KZ_SERIENBRIEF, ANSC_PTS, ANSC_USER, ANSC_#HAUSNRZ, ANSC_ADRESSZUSATZ,
				ANSC_#PTS, ANSC_ID_INT, ANSC_KZ_REPLIKATION, ANSC_KZ_FREIGABE, ANSC_ID_REFERENZ, GSTA_ID )
			select	ANSC_ID, MAND_ID, EIGE_ID, GEPA_ID, ANAR_ID, STRV_ID, ANSC_HAUSNR, ANSC_HAUSNRZ,
				PERS_ID, ANSC_KZ_SERIENBRIEF, ANSC_PTS, ANSC_USER, ANSC_#HAUSNRZ, ANSC_ADRESSZUSATZ,
				ANSC_#PTS, ANSC_ID_INT, ANSC_KZ_REPLIKATION, ANSC_KZ_FREIGABE, ANSC_ID_REFERENZ, GSTA_ID
			from	#anschrift3

			select	@SQL_ERROR = @@error

			--GeoSearch
			if ( @@ANSC_KZ_SERIENBRIEF = 1 )
			begin
				Set @IsNewRegistry = 0;
				begin try
					exec	[geoiadm].[pss_GetNewGeoInformation]
							@SESSION_ID			= @SESSION_ID,
							@ANSC_USER_MODIFIED = @ANSC_USER_MODIFIED,
							@ANSC_ID			= @@ANSC_ID,
							@ISNEWREGISTRY		= @IsNewRegistry,
							@DEBUG				= @DEBUG
					
				end try
				begin catch
					select	@rc_text = N'Error on pss_GetNewGeoInformation while updating in geoiadm.IO_GEOINFORMATION.' + ERROR_MESSAGE();
				end catch
			end
		end

		--drop table #anschrift3

		if ( @SQL_ERROR <> 0 )
		begin
			select	@RC_TEXT = dbo.pfn_GetErrorMessage('0010052', '', '')

			if ( @TRANSACTION = 1 )
			begin
				if @ThrowError = 1
					raiserror( @RC_TEXT, 11, 1 )
				rollback transaction @trans
			end

			select @@ANSC_ID = null
			return
		end
	end

	if ( @TRANSACTION = 1 )
	begin
		commit transaction @trans
	end

	if ( @DEBUG = 1 )
	begin
		select	object_name( @@procid ), @rc as RC, @rc_text as RC_TEXT
	end

END
