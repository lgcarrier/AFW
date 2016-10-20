SET DEFINE OFF;
create or replace procedure op (pva_1   in varchar2 default sqlerrm
                               ,pva_2   in varchar2 default dbms_utility.format_error_backtrace ())
is
  vva_2   varchar2 (32767);
begin
  if pva_2 is not null
  then
    vva_2      :=
         ' -- '
      || pva_2;
  end if;

  dbms_output.put_line (   pva_1
                        || vva_2);
end op;
/
