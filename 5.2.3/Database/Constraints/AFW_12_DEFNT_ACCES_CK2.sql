SET DEFINE OFF;
ALTER TABLE AFW_12_DEFNT_ACCES ADD (
  CONSTRAINT AFW_12_DEFNT_ACCES_CK2
  CHECK ((    ref_opert is not null   and   ref_struc_aplic is null  )
    or  (    ref_opert is null   and   ref_struc_aplic is not null  )
)
  ENABLE VALIDATE)
/
