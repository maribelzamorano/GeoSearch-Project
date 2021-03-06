USE [TIS02O_THILLM_SYST]
GO
/****** Object:  StoredProcedure [geoiadm].[pss_GetLongLat]    Script Date: 09/01/2010 15:39:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [geoiadm].[pss_GetLongLat]
@Address varchar(80) = NULL OUTPUT,
@City varchar(40) = NULL OUTPUT,
@State varchar(40) = NULL OUTPUT,
@Country varchar(40) = NULL OUTPUT,
@PostalCode varchar(20) = NULL OUTPUT,

@County varchar(40) = NULL OUTPUT,

@GPSLatitude numeric(9,6) = NULL OUTPUT,
@GPSLongitude numeric(9,6) = NULL OUTPUT,
@MapURL varchar(1024) = NULL OUTPUT,
@XML xml = NULL OUTPUT

AS
BEGIN
 SET NOCOUNT ON

DECLARE @URL varchar(MAX)
 SET @URL = 'http://maps.google.com/maps/api/geocode/xml?sensor=false&address=' +
 CASE WHEN @Address IS NOT NULL THEN @Address ELSE '' END +
 CASE WHEN @City IS NOT NULL THEN ', ' + @City ELSE '' END +
 CASE WHEN @State IS NOT NULL THEN ', ' + @State ELSE '' END +
 CASE WHEN @PostalCode IS NOT NULL THEN ', ' + @PostalCode ELSE '' END +
 CASE WHEN @Country IS NOT NULL THEN ', ' + @Country ELSE '' END
 SET @URL = REPLACE(@URL, ' ', '+')

 DECLARE @Response varchar(8000)
 DECLARE @Obj int 
 DECLARE @Result int 
 DECLARE @HTTPStatus int 
 DECLARE @ErrorMsg varchar(MAX)

EXEC @Result = sp_OACreate 'MSXML2.ServerXMLHttp', @Obj OUT 

 BEGIN TRY
 EXEC @Result = sp_OAMethod @Obj, 'open', NULL, 'GET', @URL, false
 EXEC @Result = sp_OAMethod @Obj, 'setRequestHeader', NULL, 'Content-Type', 'application/x-www-form-urlencoded'
 EXEC @Result = sp_OAMethod @Obj, send, NULL, ''
 EXEC @Result = sp_OAGetProperty @Obj, 'status', @HTTPStatus OUT 
 EXEC @Result = sp_OAGetProperty @Obj, 'responseXML.xml', @Response OUT 
 END TRY
 BEGIN CATCH
 SET @ErrorMsg = ERROR_MESSAGE()
 END CATCH

 EXEC @Result = sp_OADestroy @Obj

IF (@ErrorMsg IS NOT NULL) OR (@HTTPStatus <> 200) BEGIN
 SET @ErrorMsg = 'Error in spGeocode: ' + ISNULL(@ErrorMsg, 'HTTP result is: ' + CAST(@HTTPStatus AS varchar(10)))
 RAISERROR(@ErrorMsg, 16, 1, @HTTPStatus)
 RETURN 
 END

SET @XML = CAST(@Response AS XML)

 SET @GPSLatitude = @XML.value('(/GeocodeResponse/result/geometry/location/lat) [1]', 'numeric(9,6)')
 SET @GPSLongitude = @XML.value('(/GeocodeResponse/result/geometry/location/lng) [1]', 'numeric(9,6)')

SET @City = @XML.value('(/GeocodeResponse/result/address_component[type="locality"]/long_name) [1]', 'varchar(40)') 
 SET @State = @XML.value('(/GeocodeResponse/result/address_component[type="administrative_area_level_1"]/short_name) [1]', 'varchar(40)') 
 SET @PostalCode = @XML.value('(/GeocodeResponse/result/address_component[type="postal_code"]/long_name) [1]', 'varchar(20)') 
 SET @Country = @XML.value('(/GeocodeResponse/result/address_component[type="country"]/short_name) [1]', 'varchar(40)') 
 SET @County = @XML.value('(/GeocodeResponse/result/address_component[type="administrative_area_level_2"]/short_name) [1]', 'varchar(40)') 

 SET @Address = 
 ISNULL(@XML.value('(/GeocodeResponse/result/address_component[type="street_number"]/long_name) [1]', 'varchar(40)'), '???') + ' ' +
 ISNULL(@XML.value('(/GeocodeResponse/result/address_component[type="route"]/long_name) [1]', 'varchar(40)'), '???') 
 SET @MapURL = 'http://maps.google.com/maps?f=q&hl=en&q=' + CAST(@GPSLatitude AS varchar(20)) + '+' + CAST(@GPSLongitude AS varchar(20))


END