SET DEFINE OFF;
ALTER TABLE AFW_37_LIEN_GADGT_PARMT_RACRC ADD (
  CONSTRAINT AFW_37_LIEN_GADGT_PARMT_R_CK1
  CHECK ((ref_gadgt_parmt_racrc is null and nom is not null and forml_don is not null)
or (ref_gadgt_parmt_racrc is not null and nom is null and forml_don is null))
  ENABLE VALIDATE)
/
