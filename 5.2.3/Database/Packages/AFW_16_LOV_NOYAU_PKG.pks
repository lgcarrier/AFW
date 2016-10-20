SET DEFINE OFF;
create or replace package afw_16_lov_noyau_pkg
as
  function obten_lov_item (pnu_seqnc_item in number)
    return varchar2;
end afw_16_lov_noyau_pkg;
/
