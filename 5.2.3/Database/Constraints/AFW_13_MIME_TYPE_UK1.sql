SET DEFINE OFF;
ALTER TABLE AFW_13_MIME_TYPE ADD (
  CONSTRAINT AFW_13_MIME_TYPE_UK1
  UNIQUE (EXT, MIME_TYPE)
  ENABLE VALIDATE)
/
