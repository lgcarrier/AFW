SET DEFINE OFF;
create or replace force view vd_i_afw_21_plugn_calnd_coulr
(
  seqnc
 ,ordre_presn
 ,coulr
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
 ,coulr_text
)
as
  select seqnc
        ,ordre_presn
        ,coulr
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
        ,coulr_text
    from afw_21_plugn_calnd_coulr
/
