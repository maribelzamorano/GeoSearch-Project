/*	
 * topdev GmbH, erstellt am 09.08.2010 13:00
 *
 * $Author: Egael Gomez $
 * $Date: JJJJ-MM-TT HH:MM:SS $
 * $Rev: _ $
 * -------------------------------------------
 * $Workfile: (01) geoiadm.GeoPostal.sql $
 *
 */
if exists ( select * from sysobjects where id = object_id('geoiadm.IO_GEOPOSTAL') and OBJECTPROPERTY(id, 'IsTable') = 1)
begin
	goto createView;
end;

create table geoiadm.IO_GEOPOSTAL(
	GEOP_ID				UDT_ID IDENTITY NOT FOR REPLICATION,

--->
	GEOP_COUNTRYCODE    VARCHAR(2)		NOT NULL,
	GEOP_POSTALCODE		VARCHAR(10)		NOT NULL,
	GEOP_PLACENAME	    NVARCHAR(200)   NOT NULL,
	GEOP_ADMINNAME1		NVARCHAR(100)	NULL,
	GEOP_ADMINCODE1		VARCHAR(20)		NULL,
	GEOP_ADMINNAME2		NVARCHAR(100)	NULL,
	GEOP_ADMINCODE2		VARCHAR(20)		NULL,
	GEOP_ADMINNAME3		NVARCHAR(100)	NULL,
	GEOP_LATITUDE		FLOAT			NOT NULL,
	GEOP_LONGITUDE		FLOAT			NOT NULL,
	GEOP_ACCURACY		SMALLINT		NULL,				

---<

	CONSTRAINT PK_GEOP PRIMARY KEY CLUSTERED ( GEOP_ID )
);

CREATE UNIQUE INDEX GEOP_IX_01_U ON geoiadm.IO_GEOPOSTAL( GEOP_UQID );
CREATE INDEX		GEOP_IX_02	 ON geoiadm.IO_GEOPOSTAL( GEOP_KZ_GELOESCHT );

createView:

if not exists ( select * from sysobjects where id = object_id('geoiadm.T_GEOPOSTAL') and OBJECTPROPERTY(id, 'IsView') = 1)
begin
	exec (N'create view geoiadm.T_GEOPOSTAL as select * from INFORMATION_SCHEMA.TABLES;' );
end
GO

alter view geoiadm.T_GEOPOSTAL(
		GEOP_ID,
		
		GEOP_COUNTRYCODE,
		GEOP_POSTALCODE,	
		GEOP_PLACENAME,
		GEOP_ADMINNAME1,
		GEOP_ADMINCODE1,
		GEOP_ADMINNAME2,
		GEOP_ADMINCODE2,
		GEOP_ADMINNAME3,
		GEOP_LATITUDE,
		GEOP_LONGITUDE,
		GEOP_ACCURACY

) as
select 		
		GEOP_ID,
		
		GEOP_COUNTRYCODE,
		GEOP_POSTALCODE,	
		GEOP_PLACENAME,
		GEOP_ADMINNAME1,
		GEOP_ADMINCODE1,
		GEOP_ADMINNAME2,
		GEOP_ADMINCODE2,
		GEOP_ADMINNAME3,
		GEOP_LATITUDE,
		GEOP_LONGITUDE,
		GEOP_ACCURACY
	

from	geoiadm.IO_GEOPOSTAL


GO
