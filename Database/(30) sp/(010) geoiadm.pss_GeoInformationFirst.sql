/*	
 * topdev GmbH, erstellt am 09.08.2010 10:34
 *
 * $Author: Maribel Zamorano $
 * $Date: 2010-08-09 10:34:45 $
 * $Rev: _ $
 * -------------------------------------------
 * $Workfile: (010) geoiadm.pss_GeoInformationFirst.sql $
 *
 */

if not exists ( select * from sysobjects where id = object_id('geoiadm.pss_GeoInformationFirst') and OBJECTPROPERTY(id, 'IsProcedure') = 1)
begin
	exec( N'create procedure geoiadm.pss_GeoInformationFirst
	as begin
		print ''Procedure created.'';
	end' );
end
GO

ALTER procedure [geoiadm].[pss_GeoInformationFirst]
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
			@step		nvarchar(100),

			@gepa_id	udt_id,
			@ansc_id	udt_id,
			@schulname	nvarchar(202),
			@schulart	nvarchar(50),
			@cc_plz_ort	nvarchar(61),
			@cc_strasse nvarchar(101),


			@Address		varchar(80),
			@Country		varchar(40),
			@City			varchar(40),
			@PostalCode		varchar(20),
			@GeoPLatitude	numeric(9, 6),
			@GeoPLongitude	numeric(9, 6),
			@GPSLatitude	numeric(9, 6),
			@GPSLongitude	numeric(9, 6)
			

	set @GPSLatitude = null
	set @GPSLongitude = null
		
	set @step = 'Selecting the main address of the registered schools.';	
	if ( @DEBUG = 1 )	print @step;

	DECLARE cur INSENSITIVE CURSOR FOR
	SELECT  gepa.GEPA_ID,ANSC_ID, gepa.GEPA_#NAME_12, 
			SCHU_BEZEICHNUNG_LANG,CC_PLZ_ORT,CC_STRASSE
			from	thillmuser.IO_GESCHAEFTSPARTNER gepa  
			join	thillmuser.IO_DIENSTSTELLE dien on ( dien.GEPA_ID = gepa.GEPA_ID ) 
			join	thillmuser.IO_SCHULTYP schu on ( schu.SCHU_ID = dien.SCHU_ID ) 
			join	thillmuser.V_ANSCHRIFT ansc on ( ansc.GEPA_ID = gepa.GEPA_ID and ANSC_KZ_SERIENBRIEF = 1 ) 
			where ansc_kz_serienbrief=1
	
	BEGIN TRY
		OPEN cur

		while 1 = 1
		begin
			fetch cur into @gepa_id,@ansc_id,@schulname,@schulart,@cc_plz_ort,@cc_strasse
			if @@fetch_status <0
			break

			set @step = 'Getting longitud and latitude for the given address.';	
			if ( @DEBUG = 1 )	print @step;
				
				select	@Address = @cc_strasse,	@Country = N'DE', @PostalCode = SUBSTRING(@cc_plz_ort,1,5), @City=SUBSTRING(@cc_plz_ort,6,50)
				
				begin try
					exec	[geoiadm].[pss_GetLongLat]
							@Address = @Address output,
							@Country = @Country output,
							@PostalCode = @PostalCode output,
							@GPSLatitude = @GPSLatitude output,
							@GPSLongitude = @GPSLongitude output,
							@City = @City output
				end try

				begin catch
					select	@rc = -1, @sql_error = ERROR_NUMBER(),
							@rc_text = N'Error on Google Web Service.' + ERROR_MESSAGE();
				end catch

				if @GPSLongitude is NULL
					begin
						set @step = 'Google web service is unavaiable, getting the temporal longitude and latitude.';	
						if ( @DEBUG = 1 )	print @step

						select  @GeoPLongitude = GEOP_LONGITUDE,
								@GeoPLatitude = GEOP_LATITUDE
						from    geoiadm.IO_GEOPOSTAL
						where   GEOP_POSTALCODE = SUBSTRING(@cc_plz_ort,1,5)

						set @step = 'Inserting the values with GeoPostal. ' + CONVERT(VARCHAR(50),@ansc_id);	
						if ( @DEBUG = 1 )	print @step

						exec	[geoiadm].[pss_GEOI_IUD]
								@SESSION_ID=@SESSION_ID,
								@USER=@USER,
								@GEOI_ID=NULL,
								@GEOI_USER=NULL,
								@GEOI_XPTS=NULL,
								@AAKT_CODE=10,
								@ANSC_ID=@ansc_id,
								@GEOI_LATITUDE=@GeoPLatitude,
								@GEOI_LONGITUDE=@GeoPLongitude,
								@GEOI_ISTEMPORARY=1,
								@DEBUG=0
					end	
				else
				begin
					set @step = 'Inserting the values with Google. ' + CONVERT(VARCHAR(50),@ansc_id);	
					if ( @DEBUG = 1 )	print @step

					exec	[geoiadm].[pss_GEOI_IUD]
							@SESSION_ID=@SESSION_ID,
							@USER=@USER,
							@GEOI_ID=NULL,
							@GEOI_USER=NULL,
							@GEOI_XPTS=NULL,
							@AAKT_CODE=10,
							@ANSC_ID=@ansc_id,
							@GEOI_LATITUDE=@GPSLatitude,
							@GEOI_LONGITUDE=@GPSLongitude,
							@GEOI_ISTEMPORARY=0,
							@DEBUG=0	
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

GO

