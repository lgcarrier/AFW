SET DEFINE OFF;
ALTER TABLE AFW_03_LIEN_CLAS_INTER_UTILS ADD (
  CONSTRAINT AFW_03_LIEN_CLAS_INTER_UTI_CK1
  CHECK ((ref_group_utils is not null  and ref_utils is null )  or  (
ref_group_utils is null    and    ref_utils is not null  ))
  ENABLE VALIDATE)
/
