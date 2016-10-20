SET DEFINE OFF;
create or replace force view vd_i_afw_01_mesg_infor
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
    from afw_01_mesg_infor
/
