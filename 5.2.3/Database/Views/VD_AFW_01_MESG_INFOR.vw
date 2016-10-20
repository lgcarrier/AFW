SET DEFINE OFF;
create or replace force view vd_afw_01_mesg_infor
(
  seqnc
 ,text_mesg
 ,utils_creat
 ,date_creat
 ,sess_id
 ,ref_utils
 ,ref_mesg_lang
)
as
  select seqnc
        ,text_mesg
        ,utils_creat
        ,date_creat
        ,sess_id
        ,ref_utils
        ,ref_mesg_lang
    from vd_i_afw_01_mesg_infor
   where    sess_id = afw_07_util_pkg.nv ('APP_SESSION')
         or ref_utils = afw_12_utils_pkg.obten_usagr_conct
  with check option
/
