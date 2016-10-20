SET DEFINE OFF;
ALTER TABLE AFW_19_BOUTN ADD (
  CONSTRAINT AFW_19_BOUTN_CK1
  CHECK ((ID_TEMPL_BOUTN is not null and TEMPL_BOUTN is null)
        or
        (ID_TEMPL_BOUTN is null and TEMPL_BOUTN is not null)
        or
        (ID_TEMPL_BOUTN is null and TEMPL_BOUTN is null)
       )
  ENABLE VALIDATE)
/
