/*	
 * topdev GmbH, erstellt am 09.08.2010 15:00
 *
 * $Author: Alan Orduno $
 * $Date: JJJJ-MM-TT HH:MM:SS $
 * $Rev: _ $
 * -------------------------------------------
 * $Workfile: (10) geoiadm.pfn_LatPlusDistance.sql $
 *
 */

if exists(select * from sysobjects where id = object_id('geoiadm.LatPlusDistance') and xtype in (N'FN', N'IF', N'TF'))
	drop function geoiadm.LatPlusDistance
GO

CREATE FUNCTION [geoiadm].[LatPlusDistance](@StartLatitude FLOAT, @Distance FLOAT) 
RETURNS FLOAT
AS
BEGIN
	RETURN (SELECT @StartLatitude + SQRT(@Distance * @Distance / 4766.8999155991))
END
GO