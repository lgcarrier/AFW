SET DEFINE OFF;
create or replace force view vd_afw_12_sesn
(
  id_sesn
 ,app_user
 ,ref_lang
)
as
  select id_sesn
        ,app_user
        ,ref_lang
    from vd_i_afw_12_sesn
/
