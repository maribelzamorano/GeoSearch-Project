/*	
 * topdev GmbH, erstellt am 09.08.2010 13:00
 *
 * $Author: Alan Orduno $
 * $Date: JJJJ-MM-TT HH:MM:SS $
 * $Rev: _ $
 * -------------------------------------------
 * $Workfile: (01) geoiadm.GeoInformation.sql $
 *
 */
if exists ( select * from sysobjects where id = object_id('geoiadm.IO_GEOINFORMATION') and OBJECTPROPERTY(id, 'IsTable') = 1)
begin
	goto createView;
end;

create table geoiadm.IO_GEOINFORMATION(
	GEOI_ID				UDT_ID IDENTITY NOT FOR REPLICATION,

--->
	ANSC_ID				UDT_ID		NOT NULL,
--->
	GEOI_LATITUDE		FLOAT		NOT NULL,
	GEOI_LONGITUDE		FLOAT		NOT NULL,
	GEOI_ISTEMPORARY	BIT			NOT NULL,

---<
	GEOI_USER			UDT_USER	NOT NULL,
	GEOI_PTS			UDT_PTS		NOT NULL,
	GEOI_#PTS			UDT_#PTS	NULL,	
	GEOI_CODE_INT		UDT_ID_0	NOT NULL,
	GEOI_UQID			UDT_UQID	NOT NULL ROWGUIDCOL,
	GEOI_KZ_FREIGABE	UDT_BOOLEAN	NOT NULL,
	GEOI_KZ_REPLIKATION	UDT_BOOLEAN	NOT NULL,
	GEOI_KZ_GELOESCHT	UDT_BOOLEAN	NOT NULL,

	CONSTRAINT PK_GEOI PRIMARY KEY CLUSTERED ( GEOI_ID )
);

CREATE UNIQUE INDEX GEOI_IX_01_U ON geoiadm.IO_GEOINFORMATION( GEOI_UQID );
CREATE INDEX		GEOI_IX_02	 ON geoiadm.IO_GEOINFORMATION( GEOI_KZ_GELOESCHT );

createView:

if not exists ( select * from sysobjects where id = object_id('geoiadm.T_GEOINFORMATION') and OBJECTPROPERTY(id, 'IsView') = 1)
begin
	exec (N'create view geoiadm.T_GEOINFORMATION as select * from INFORMATION_SCHEMA.TABLES;' );
end
GO

alter view geoiadm.T_GEOINFORMATION(
		GEOI_ID,
		
		ANSC_ID,
		GEOI_LATITUDE,	
		GEOI_LONGITUDE,
		GEOI_ISTEMPORARY,	

		GEOI_USER,
		GEOI_PTS,
		GEOI_#PTS
) as
select 		
		GEOI_ID,

		ANSC_ID,
		GEOI_LATITUDE,	
		GEOI_LONGITUDE,
		GEOI_ISTEMPORARY,	

		GEOI_USER,
		GEOI_PTS,
		GEOI_#PTS

from	geoiadm.IO_GEOINFORMATION
where	GEOI_KZ_GELOESCHT = 0;

GO
