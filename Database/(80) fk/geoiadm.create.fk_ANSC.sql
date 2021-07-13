/*	
 * topdev GmbH, erstellt am 09.08.2010 12:30
 *
 * $Author: Alan Orduno $
 * $Date: JJJJ-MM-TT HH:MM:SS $
 * $Rev: _ $
 * -------------------------------------------
 * $Workfile: (06) geoiadm.create.fk_ANSC.sql $
 *
 */

IF EXISTS (SELECT 1 FROM sysobjects WHERE NAME = 'FK_ANSC_GEOI'
and xtype='F'
and parent_obj = object_id('geoiadm.IO_GEOINFORMATION'))

ALTER TABLE geoiadm.IO_GEOINFORMATION DROP CONSTRAINT FK_ANSC_GEOI;

GO

CREATE INDEX FK_ANSC_GEOI ON geoiadm.IO_GEOINFORMATION( ANSC_ID );
GO