SET DEFINE OFF;
create or replace package afw_11_authe_apex_pkg
is
  function valid_utils (p_username   in varchar2
                       ,p_password   in varchar2)
    return boolean;
end afw_11_authe_apex_pkg;
/
