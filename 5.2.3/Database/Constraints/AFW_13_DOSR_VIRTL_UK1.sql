SET DEFINE OFF;
ALTER TABLE AFW_13_DOSR_VIRTL ADD (
  CONSTRAINT AFW_13_DOSR_VIRTL_UK1
  UNIQUE (REF_PRODT, CODE)
  ENABLE VALIDATE)
/