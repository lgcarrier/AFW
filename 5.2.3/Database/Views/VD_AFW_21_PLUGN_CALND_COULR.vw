SET DEFINE OFF;
create or replace force view vd_afw_21_plugn_calnd_coulr
(
  seqnc
 ,ordre_presn
 ,coulr
 ,coulr_text
 ,date_creat
 ,utils_creat
 ,date_modfc
 ,utils_modfc
)
as
  select seqnc
        ,ordre_presn
        ,coulr
        ,coulr_text
        ,date_creat
        ,utils_creat
        ,date_modfc
        ,utils_modfc
    from vd_i_afw_21_plugn_calnd_coulr
/
