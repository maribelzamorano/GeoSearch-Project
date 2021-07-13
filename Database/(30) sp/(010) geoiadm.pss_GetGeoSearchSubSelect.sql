/*	
 * topdev GmbH, erstellt am 09.08.2010 14:25
 *
 * $Author: Maribel Zamorano $
 * $Date: 2010-08-09 14:25:56 $
 * $Rev: _ $
 * -------------------------------------------
 * $Workfile: (010) geoiadm.pss_GetGeoSearchSubSelect.sql $
 *
 */

if not exists ( select * from sysobjects where id = object_id('geoiadm.pss_GetGeoSearchSubSelect') and OBJECTPROPERTY(id, 'IsProcedure') = 1)
begin
	exec( N'create procedure geoiadm.pss_GetGeoSearchSubSelect
	as begin
		print ''Procedure created.'';
	end' );
end
GO

ALTER procedure [geoiadm].[pss_GetGeoSearchSubSelect]
	@GEOSELECT				nvarchar(max)	= null OUTPUT,
	@GEOFROM				nvarchar(max)	= null OUTPUT,
	@GEOWHERE				nvarchar(max)	= null OUTPUT,
	@GEOGROUPBY				nvarchar(max)	= null OUTPUT,
	@GEOORDERBY				nvarchar(max)	= null OUTPUT,
	@USER_LONGITUDE			decimal(8,5),
	@USER_LATITUDE			decimal(8,5),
	@RADIUS					float			= null,
	@NUMBER_OF_NEAREST		integer			= null,
-->
	@DEBUG					bit = 0		
as begin


	set nocount on;

	declare	@step			nvarchar(100),

			@MinLongitude	decimal(8,5),
			@MaxLongitude	decimal(8,5),
			@MinLatitude	decimal(8,5),
			@MaxLatitude	decimal(8,5),
			@distance		float,
			@Country		varchar(40)



	if @RADIUS is not null	
	begin
		set @step = 'Radius search begins.';	
		if ( @DEBUG = 1 )	print @step

		set	@distance = @RADIUS  

		-- Calculate the Max Lat/Long

		SELECT @MaxLongitude = geoiadm.LongPlusDistance(@USER_LONGITUDE, @USER_LATITUDE, @distance),
		 @MaxLatitude = geoiadm.LatPlusDistance(@USER_LATITUDE, @distance)


		-- Calculate the min lat/long

		SELECT @MinLatitude = 2 * @USER_LATITUDE - @MaxLatitude,
		 @MinLongitude = 2 * @USER_LONGITUDE - @MaxLongitude

		-- The query to return all the schools at certain distance

		set @GEOSELECT = 
				N'Select GEOI_LONGITUDE as longitude, GEOI_LATITUDE as latitude,' + ' ' +
				N'geoiadm.CalculateDistance('+CONVERT(NVARCHAR(50),@USER_LONGITUDE)+', '+
				CONVERT(NVARCHAR(50),@USER_LATITUDE)+', GEOI_LONGITUDE, GEOI_LATITUDE) as Distance,';

		set @GEOFROM = 		
				N'join geoiadm.IO_GEOINFORMATION geoi on ( ansc.ANSC_ID = geoi.ANSC_ID)' + ' ' ;

		set @GEOWHERE =
				N'And GEOI_LONGITUDE Between '+
				CONVERT(NVARCHAR(50),@MinLongitude)+' And '+ CONVERT(NVARCHAR(50),@MaxLongitude)+'' + ' ' +
				N'And GEOI_LATITUDE Between '+
				CONVERT(NVARCHAR(50),@MinLatitude)+' And '+ CONVERT(NVARCHAR(50),@MaxLatitude)+'' + ' ' +
				N'And geoiadm.CalculateDistance('+CONVERT(NVARCHAR(50),@USER_LONGITUDE)+', '+
				CONVERT(NVARCHAR(50),@USER_LATITUDE)+', GEOI_LONGITUDE, GEOI_LATITUDE) <= '+ CONVERT(NVARCHAR(50),@distance)+' '+
				N'and ( gepa.GEPA_KZ_VERALTET = 0 
					  and exists( select 1 from tspadm.T_WHITELIST_GEPA 
				      where tspadm.T_WHITELIST_GEPA.GEPA_ID = gepa.GEPA_ID ))' +' ';
		
		set @GEOGROUPBY = '';

		set @GEOORDERBY = 'Order by Distance,';

	end

	if @NUMBER_OF_NEAREST is not null
	begin

		set @step = 'Nearest schools search begins.';	
		if ( @DEBUG = 1 )	print @step


		set @GEOSELECT = 
				N'Select top '+CONVERT(NVARCHAR(50),@NUMBER_OF_NEAREST)+' '+N'min(GEOI_LONGITUDE) as longitude,' + ' ' +
				N'min(GEOI_LATITUDE)as latitude,' + ' ' +
				N'min(geoiadm.CalculateDistance('+CONVERT(NVARCHAR(50),@USER_LONGITUDE)+', '+
				CONVERT(NVARCHAR(50),@USER_LATITUDE)+', GEOI_LONGITUDE, GEOI_LATITUDE)) as distance,' + ' ' ;

		set @GEOFROM = 
				N'join geoiadm.IO_GEOINFORMATION geoi on ( ansc.ANSC_ID = geoi.ANSC_ID)' + ' ' ;

		set @GEOWHERE =
				N'And geoiadm.CalculateDistance('+CONVERT(NVARCHAR(50),@USER_LONGITUDE)+', '+
				CONVERT(NVARCHAR(50),@USER_LATITUDE)+', GEOI_LONGITUDE, GEOI_LATITUDE)>=0' + ' ' +
				N'and ( gepa.GEPA_KZ_VERALTET = 0 
					  and exists( select 1 from tspadm.T_WHITELIST_GEPA 
				      where tspadm.T_WHITELIST_GEPA.GEPA_ID = gepa.GEPA_ID ))' +' ';

		set @GEOGROUPBY =
				N'group by geoi.ansc_id,gepa.GEPA_ID,DIEN_NR,traeger.GEPA_#NAME_12,gepa.GEPA_#NAME_12,'+
				N'gepa.GEPA_NAME_1,SCHU_BEZEICHNUNG_LANG,CC_PLZ_ORT,CC_STRASSE,schu.SCHU_ID,dien.KREI_ID,'+
				N'sptm.CC_LETZTE_AENDERUNG,' + ' ' +'schu.SCHU_SORT,' +' '+'schu.SCHU_BEZEICHNUNG_KURZ' +' ';

		set @GEOORDERBY =
				N'order by min(geoiadm.CalculateDistance('+CONVERT(NVARCHAR(50),@USER_LONGITUDE)+', '+
				CONVERT(NVARCHAR(50),@USER_LATITUDE)+', GEOI_LONGITUDE, GEOI_LATITUDE)),';

	end



	if ( @DEBUG = 1 )
	begin
		print	'@GEOSELECT = '	+@GEOSELECT
		print	'@GEOFROM = '	+@GEOFROM
		print	'@GEOWHERE = '	+@GEOWHERE
		if @GEOGROUPBY !=''	begin print '@GEOGROUPBY = '+@GEOGROUPBY end
		if @GEOORDERBY !='' begin print '@GEOORDERBY = '+@GEOORDERBY end
	end


end
GO