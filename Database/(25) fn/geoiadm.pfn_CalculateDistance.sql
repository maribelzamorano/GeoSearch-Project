/*	
 * topdev GmbH, erstellt am 09.08.2010 14:30
 *
 * $Author: Alan Orduno $
 * $Date: JJJJ-MM-TT HH:MM:SS $
 * $Rev: _ $
 * -------------------------------------------
 * $Workfile: (10) geoiadm.pfn_CalculateDistance.sql $
 *
 */

if exists(select * from sysobjects where id = object_id('geoiadm.CalculateDistance') and xtype in (N'FN', N'IF', N'TF'))
	drop function geoiadm.CalculateDistance
GO

CREATE FUNCTION [geoiadm].[CalculateDistance]
	(@Longitude1 DECIMAL(8,5),
	 @Latitude1   DECIMAL(8,5),
	 @Longitude2  DECIMAL(8,5),
	 @Latitude2   DECIMAL(8,5))
RETURNS FLOAT
AS
BEGIN
	DECLARE @Temp FLOAT
	SET @Temp = SIN(@Latitude1/57.2957795130823) * SIN(@Latitude2/57.2957795130823) + COS(@Latitude1/57.2957795130823) * COS(@Latitude2/57.2957795130823) * COS(@Longitude2/57.2957795130823 - @Longitude1/57.2957795130823)
	IF @Temp > 1
		SET @Temp = 1
	ELSE IF @Temp < -1
		SET @Temp = -1
RETURN (3958.75586574 * ACOS(@Temp) )
END
GO