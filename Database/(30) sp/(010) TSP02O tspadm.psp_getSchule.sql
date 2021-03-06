USE [TSP02O]
GO
/****** Object:  StoredProcedure [tspadm].[psp_getSchule]    Script Date: 09/02/2010 17:46:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

ALTER procedure [tspadm].[psp_getSchule]
	@SESSION_ID	nvarchar(37),
	@RC		integer			output,
	@SQL_ERROR	integer			output,
	@RC_TEXT	nvarchar(255)		output,

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
	@SCHU_ID	UDT_ID			= null, -- Schul-ID (GEPA-ID)
	@KREI_ID	UDT_ID			= null,	-- Schulamt

	@GEPA_ID_TRAEGER	UDT_ID		= null,
	@SCHULTRAEGER	nvarchar(202)	= null, -- Schulträger
--
	@USER_LONGITUDE		decimal(8,5)	= null,	-- der Benutzer
	@USER_LATITUDE		decimal(8,5)	= null,	-- der Benutzer
	@RADIUS				float			= null,
	@NUMBER_OF_NEAREST	integer			= null,
--
	@KZ_INSERT	bit			= 0	output,
	@DEBUG		tinyint			= 0,
	@SUCHBEGRIFF nvarchar(1000)	= null,
	@SPSS_CODE	UDT_CODE = null

as begin
	set nocount on

	select	@RC = 0,
		@SQL_ERROR = 0,
		@RC_TEXT = ''

	declare	@tis02o 	sysname,
		@sql		Nvarchar(4000),
		@parms		nvarchar(1000)

	select	@tis02o = dbo.pfn_GetTIS02O()
	select	@sql = 	N'exec ' + @tis02o + '.tspadm.psp_getSchule ' +
				N'@SESSION_ID	= @SESSION_ID, ' +
				N'@RC		= @RC output, ' +
				N'@SQL_ERROR	= @SQL_ERROR output, ' +
				N'@RC_TEXT	= @RC_TEXT output, ' +
				N'@ROWS		= @ROWS, ' +
				N'@PAGE		= @PAGE, ' +
				N'@MAX_CHAR	= @MAX_CHAR, ' +
				N'@USE_RESULTSET = @USE_RESULTSET, ' +
				N'@ROWCOUNTER	= @ROWCOUNTER output, ' +
				N'@GEPA_NAME	= @GEPA_NAME, ' +
				N'@DIEN_NR	= @DIEN_NR, ' +
				N'@STRASSE	= @STRASSE, ' +
				N'@PLZ		= @PLZ, ' +
				N'@ORT		= @ORT, ' +
				N'@SCHU_ID	= @SCHU_ID, ' +
				N'@KREI_ID	= @KREI_ID, ' +
				N'@GEPA_ID_TRAEGER = @GEPA_ID_TRAEGER, ' +
				N'@SCHULTRAEGER	= @SCHULTRAEGER, ' +
				N'@USER_LONGITUDE =	@USER_LONGITUDE, ' +
				N'@USER_LATITUDE = @USER_LATITUDE, '+
				N'@RADIUS = @RADIUS, ' +
				N'@NUMBER_OF_NEAREST= @NUMBER_OF_NEAREST, ' +
				N'@KZ_INSERT	= @KZ_INSERT output, ' +
				N'@DEBUG	= @DEBUG, '+
				N'@SPSS_CODE	= @SPSS_CODE, '+
				N'@SUCHBEGRIFF = @SUCHBEGRIFF',

		@parms =	N'@SESSION_ID	Nvarchar(37), ' +
				N'@RC		integer	output, ' +
				N'@SQL_ERROR	integer	output, ' +
				N'@RC_TEXT	Nvarchar(255) output, ' +
				N'@ROWS		bigint, ' +
				N'@PAGE		integer, ' +
				N'@MAX_CHAR	bigint, ' +
				N'@USE_RESULTSET tinyint, ' +
				N'@ROWCOUNTER	bigint output, ' +
				N'@GEPA_NAME	Nvarchar(202), ' +
				N'@DIEN_NR	nvarchar(10), ' +
				N'@STRASSE	UDT_STRASSE, ' +
				N'@PLZ		UDT_PLZ, ' +
				N'@ORT		UDT_ORT, ' +
				N'@SCHU_ID	UDT_ID, ' +
				N'@KREI_ID	UDT_ID, ' +
				N'@GEPA_ID_TRAEGER UDT_ID, ' +
				N'@SCHULTRAEGER	nvarchar(202), ' +
				N'@USER_LONGITUDE decimal(8,5), ' +
				N'@USER_LATITUDE decimal(8,5), ' +
				N'@RADIUS float, ' +
				N'@NUMBER_OF_NEAREST integer, ' +
				N'@KZ_INSERT	bit output, ' +
				N'@DEBUG	tinyint, ' +
				N'@SPSS_CODE	UDT_CODE, ' +
				N'@SUCHBEGRIFF	nvarchar(1000)'

	exec sp_executesql
		@stmt 		= @sql, 
		@params 	= @parms,
		@SESSION_ID	= @SESSION_ID,
		@RC		= @RC output,
		@SQL_ERROR	= @SQL_ERROR output,
		@RC_TEXT	= @RC_TEXT output,
		@ROWS		= @ROWS,
		@PAGE		= @PAGE,
		@MAX_CHAR	= @MAX_CHAR,
		@USE_RESULTSET	= @USE_RESULTSET,
		@ROWCOUNTER	= @ROWCOUNTER output,
		@GEPA_NAME	= @GEPA_NAME,
		@DIEN_NR	= @DIEN_NR,
		@STRASSE	= @STRASSE,
		@PLZ		= @PLZ,
		@ORT		= @ORT,
		@SCHU_ID	= @SCHU_ID,
		@KREI_ID	= @KREI_ID,
		@GEPA_ID_TRAEGER = @GEPA_ID_TRAEGER,
		@SCHULTRAEGER	= @SCHULTRAEGER,
		@USER_LONGITUDE = @USER_LONGITUDE,
		@USER_LATITUDE = @USER_LATITUDE,
		@RADIUS = @RADIUS, 
		@NUMBER_OF_NEAREST= @NUMBER_OF_NEAREST, 
		@KZ_INSERT	= @KZ_INSERT output,
		@DEBUG		= @DEBUG,
		@SPSS_CODE	= @SPSS_CODE,
		@SUCHBEGRIFF = @SUCHBEGRIFF

	set nocount off
end
