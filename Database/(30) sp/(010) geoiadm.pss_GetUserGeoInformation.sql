/*	
 * topdev GmbH, erstellt am 09.08.2010 14:25
 *
 * $Author: Maribel Zamorano $
 * $Date: 2010-08-09 14:25:56 $
 * $Rev: _ $
 * -------------------------------------------
 * $Workfile: (010) geoiadm.pss_GetUserGeoInformation.sql $
 *
 */

if not exists ( select * from sysobjects where id = object_id('geoiadm.pss_GetUserGeoInformation') and OBJECTPROPERTY(id, 'IsProcedure') = 1)
begin
	exec( N'create procedure geoiadm.pss_GetUserGeoInformation
	as begin
		print ''Procedure created.'';
	end' );
end
GO

ALTER procedure [geoiadm].[pss_GetUserGeoInformation]
	@POSTAL_CODE			UDT_PLZ			= null,	-- der Benutzer
	@CITY					UDT_ORT			= null,	-- der Benutzer
	@STREET					UDT_STRASSE		= null,	-- der Benutzer
    @USER_LONGITUDE			decimal(8,5)	= null output,
	@USER_LATITUDE			decimal(8,5)	= null output,
-->
	@DEBUG					bit = 0		
as begin


	set nocount on;

	declare	@step			nvarchar(100),
			@Country		varchar(40)

	
	if ( @POSTAL_CODE is not null )		
	begin

		set @step = 'Getting longitud and latitude for the user address.';	
		if ( @DEBUG = 1 )	print @step;
		

		select	@Country = N'DE'
		
		
		exec	[geoiadm].[pss_GetLongLat]
				@Address = @STREET output,
				@Country = @Country output,
				@PostalCode = @POSTAL_CODE,
				@City = @CITY,
				@GPSLatitude = @USER_LATITUDE output,
				@GPSLongitude = @USER_LONGITUDE output

		
		if @USER_LONGITUDE is NULL
		begin
			set @step = 'Google web service is unavaiable, getting the temporal longitude and latitude.';	
			if ( @DEBUG = 1 )	print @step

			select  @USER_LONGITUDE = GEOP_LONGITUDE,
					@USER_LATITUDE = GEOP_LATITUDE
			from    geoiadm.IO_GEOPOSTAL
			where   GEOP_POSTALCODE = @POSTAL_CODE

		end
		else
		begin
			set @step = 'Google web service is available.';	
			if ( @DEBUG = 1 )	print @step
		end

		select @USER_LONGITUDE as user_longitude,@USER_LATITUDE as user_latitude
	end
	else
	begin
		set @step = 'Postal Code is null.';	
		if ( @DEBUG = 1 )	print @step;
	end

	if ( @DEBUG = 1 )
	begin
		print	'USER LONGITUDE = '	+ CONVERT(VARCHAR(50),@USER_LONGITUDE)
		print	'USER LATITUDE = '	+ CONVERT(VARCHAR(50),@USER_LATITUDE)
	end


end

GO

