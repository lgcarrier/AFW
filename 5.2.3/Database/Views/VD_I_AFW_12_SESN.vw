SET DEFINE OFF;
create or replace force view vd_i_afw_12_sesn
(
  id_sesn
 ,app_user
 ,ref_id_sesn
 ,ref_lang
)
as
  select id_sesn
        ,app_user
        ,ref_id_sesn
        ,ref_lang
    from afw_12_sesn
/
