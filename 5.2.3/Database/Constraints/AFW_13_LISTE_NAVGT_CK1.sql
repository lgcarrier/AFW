SET DEFINE OFF;
ALTER TABLE AFW_13_LISTE_NAVGT ADD (
  CONSTRAINT AFW_13_LISTE_NAVGT_CK1
  CHECK (
    dnr_ref_aplic is not null and ref_domn is null and dnr_ref_domn is null
    or
    dnr_ref_aplic is null and ref_domn is not null and dnr_ref_domn is not null
)
  ENABLE VALIDATE)
/
