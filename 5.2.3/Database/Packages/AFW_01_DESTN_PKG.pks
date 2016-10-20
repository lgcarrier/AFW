SET DEFINE OFF;
create or replace package afw_01_destn_pkg
as
  procedure creer_destn (pnu_destn       in number
                        ,pva_nom_elemn   in varchar2
                        ,pnu_reslt_1     in number
                        ,pnu_reslt_2     in number
                        ,pnu_reslt_3     in number
                        ,pnu_reslt_4     in number
                        ,pnu_reslt_5     in number
                        ,pnu_reslt_6     in number);
end afw_01_destn_pkg;
/
