SET DEFINE OFF;
ALTER TABLE AFW_13_CONDT_EXECT ADD (
  CONSTRAINT AFW_13_CONDT_EXECT_UK1
  UNIQUE (CODE)
  ENABLE VALIDATE)
/