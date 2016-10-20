SET DEFINE OFF;
create or replace package afw_07_excep_pkg
as
  exc_parnt_not_found        exception;

  pragma exception_init (exc_parnt_not_found
                        ,-2291);

  exc_cant_inser_null        exception;

  pragma exception_init (exc_cant_inser_null
                        ,-1400);

  exc_cant_updat_null        exception;

  pragma exception_init (exc_cant_updat_null
                        ,-1407);

  exc_smtp_servc_not_avail   exception;

  pragma exception_init (exc_smtp_servc_not_avail
                        ,-29278);
end afw_07_excep_pkg;
/
