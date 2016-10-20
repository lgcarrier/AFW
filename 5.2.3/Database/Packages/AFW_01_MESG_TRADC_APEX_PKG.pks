SET DEFINE OFF;
create or replace package afw_01_mesg_tradc_apex_pkg
as
  procedure pousr_mesg_dans_aplic_apex (pnu_prodt in number);

  procedure pousr_mesg (pnu_mesg_tradc_apex in number);
end afw_01_mesg_tradc_apex_pkg;
/
