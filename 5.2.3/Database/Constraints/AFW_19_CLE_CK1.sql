SET DEFINE OFF;
ALTER TABLE AFW_19_CLE ADD (
  CONSTRAINT AFW_19_CLE_CK1
  CHECK ((CODE_KEYPR is not null and CODE_KEYDW is null)
        or
        (CODE_KEYPR is null and CODE_KEYDW is not null)
        or
        (CODE_KEYPR is null and CODE_KEYDW is null)
       )
  ENABLE VALIDATE)
/
