SET DEFINE OFF;
ALTER TABLE AFW_12_SCENR_NOTFC_ACTIO ADD (
  CONSTRAINT AFW_12_SCENR_NOTFC_ACTIO_CK1
  CHECK (       "REF_STRUC_APLIC_STAT" is not null
            and "REF_ATRIB_STRUC_APLIC_STAT" is not null
            and "REF_STAT" is not null
         or     "REF_STRUC_APLIC_STAT" is null
            and "REF_ATRIB_STRUC_APLIC_STAT" is null
            and "REF_STAT" is null)
  ENABLE VALIDATE)
/
