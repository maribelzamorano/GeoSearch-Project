/*	
 * topdev GmbH, erstellt am 09.08.2010 14:25
 *
 * $Author: Maribel Zamorano $
 * $Date: 2010-08-09 14:25:56 $
 * $Rev: _ $
 * -------------------------------------------
 * $Workfile: (010) geoiadm.pss_GetNewGeoInformation.sql $
 *
 */

if not exists ( select * from sysobjects where id = object_id('geoiadm.pss_GetNewGeoInformation') and OBJECTPROPERTY(id, 'IsProcedure') = 1)
begin
	exec( N'create procedure geoiadm.pss_GetNewGeoInformation
	as begin
		print ''Procedure created.'';
	end' );
end
GO

ALTER procedure [geoiadm].[pss_GetNewGeoInformation]
	@SESSION_ID				nvarchar(37),
	@ANSC_USER_MODIFIED		UDT_USER,	
	@ANSC_ID				UDT_ID,
	@ISNEWREGISTRY			bit,
-->
	@DEBUG					bit = 0		
as begin


	set nocount on;

	declare	@step			nvarchar(100),
			@Country		varchar(40),
			@Ort			nvarchar(61),
			@PostalCode		varchar(20),
			@Address		varchar(100),
			@City			varchar(40),
			@Longitude		decimal(8,5),
			@Latitude		decimal(8,5),
			@IsTemporary	bit,
			@rc				integer,
			@rc_text		nvarchar(1000),
			@sql_error		integer,
			@geoi_id		udt_id,
			@geoi_user		nvarchar(128),
			@geoi_xpts		nvarchar(23)


	SELECT  @Ort = CC_PLZ_ORT, @Address = CC_STRASSE
			from thillmuser.V_ANSCHRIFT
			where ANSC_ID = @ANSC_ID

	Select	@PostalCode = SUBSTRING(@Ort,1,5), @City=SUBSTRING(@Ort,6,50), @Country = N'DE'

	if ( @PostalCode is not null )		
	begin

		set @step = 'Getting longitud and latitude for the new address.';	
		if ( @DEBUG = 1 )	print @step;

		begin try
			exec	[geoiadm].[pss_GetLongLat]
					@Address = @Address,
					@Country = @Country,
					@PostalCode = @PostalCode,
					@GPSLatitude = @Latitude output,
					@GPSLongitude = @Longitude output,
					@City = @City
			
		end try
		begin catch
			select	@rc = -1, @sql_error = ERROR_NUMBER(),
					@rc_text = N'Error on Google Web Service.' + ERROR_MESSAGE();
		end catch

		if @Longitude is NULL
		begin
			set @step = 'Google web service is unavaiable, getting the temporal longitude and latitude.';	
			if ( @DEBUG = 1 )	print @step

			select  @Longitude = GEOP_LONGITUDE,
					@Latitude = GEOP_LATITUDE
			from    geoiadm.IO_GEOPOSTAL
			where   GEOP_POSTALCODE = @PostalCode
			
			set @IsTemporary = 1;
		end
		else
		begin
			set @step = 'Google web service is available.';	
			if ( @DEBUG = 1 )	print @step

			set @IsTemporary = 0;
		end

		if( @ISNEWREGISTRY = 0)
		begin
				set @step = 'Updating values in geoiadm.IO_GEOINFORMATION. ';	
				if ( @DEBUG = 1 )	print @step
				
				select @geoi_id=geoi_id,@geoi_user=geoi_user,@geoi_xpts=geoi_#pts from geoiadm.IO_GEOINFORMATION where ansc_id=@ANSC_ID
					
				exec	[geoiadm].[pss_GEOI_IUD]
						@SESSION_ID=@SESSION_ID,
						@USER=@ANSC_USER_MODIFIED,
						@GEOI_ID=@geoi_id,
						@GEOI_USER=@geoi_user,
						@GEOI_XPTS=@geoi_xpts,
						@AAKT_CODE=20,
						@ANSC_ID=@ansc_id,
						@GEOI_LATITUDE=@Latitude,
						@GEOI_LONGITUDE=@Longitude,
						@GEOI_ISTEMPORARY=@IsTemporary,
						@DEBUG=@DEBUG	
		end
		else
		begin
				set @step = 'Inserting new values in geoiadm.IO_GEOINFORMATION. ';	
				if ( @DEBUG = 1 )	print @step
				
				exec	[geoiadm].[pss_GEOI_IUD]
						@SESSION_ID=@SESSION_ID,
						@USER=@ANSC_USER_MODIFIED,
						@GEOI_ID=NULL,
						@GEOI_USER=NULL,
						@GEOI_XPTS=NULL,
						@AAKT_CODE=10,
						@ANSC_ID=@ANSC_ID,
						@GEOI_LATITUDE=@Latitude,
						@GEOI_LONGITUDE=@Longitude,
						@GEOI_ISTEMPORARY=@IsTemporary,
						@DEBUG=@DEBUG	
		end
	end
	else
	begin
		set @step = 'Postal Code is null.';	
		if ( @DEBUG = 1 )	print @step;
	end

	if ( @DEBUG = 1 )
	begin
		print	'LONGITUDE = '	+ CONVERT(VARCHAR(50),@Longitude)
		print	'LATITUDE = '	+ CONVERT(VARCHAR(50),@Latitude)
	end


end
