/*	
 * topdev GmbH, erstellt am 09.08.2010 15:30
 *
 * $Author: Alan Orduno $
 * $Date: JJJJ-MM-TT HH:MM:SS $
 * $Rev: _ $
 * -------------------------------------------
 * $Workfile: (10) geoiadm.pfn_LongPlusDistance.sql $
 *
 */

if exists(select * from sysobjects where id = object_id('geoiadm.LongPlusDistance') and xtype in (N'FN', N'IF', N'TF'))
	drop function geoiadm.LongPlusDistance
GO

CREATE FUNCTION [geoiadm].[LongPlusDistance](@StartLongitude FLOAT,@StartLatitude FLOAT,@Distance FLOAT)
RETURNS FLOAT
AS
BEGIN
	RETURN (SELECT @StartLongitude + SQRT(@Distance * @Distance / (4784.39411916406 * COS(2 * @StartLatitude / 114.591559026165) * COS(2 * @StartLatitude / 114.591559026165))))
END
GO