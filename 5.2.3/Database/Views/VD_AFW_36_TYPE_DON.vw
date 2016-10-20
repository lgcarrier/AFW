SET DEFINE OFF;
create or replace force view vd_afw_36_type_don
(
  seqnc
 ,code
 ,nom
 ,utils_creat
 ,date_creat
 ,utils_modfc
 ,date_modfc
 ,mesg_place_holdr
)
as
  select seqnc
        ,code
        ,nom
        ,utils_creat
        ,date_creat
        ,utils_modfc
        ,date_modfc
        ,mesg_place_holdr
    from vd_i_afw_36_type_don
/
