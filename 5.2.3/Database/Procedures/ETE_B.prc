SET DEFINE OFF;
create or replace procedure ete_b (pva_1   in varchar2
                                  ,pva_2   in boolean)
is
  pragma autonomous_transaction;
  vva_2   varchar2 (20);
begin
  if pva_2
  then
    vva_2   := 'TRUE';
  elsif not pva_2
  then
    vva_2   := 'FALSE';
  end if;

  insert into afw_03_trace_exect (un
                                 ,deux
                                 ,dthr
                                 ,who_called_me)
       values (pva_1
              ,vva_2
              ,systimestamp
              ,dbms_utility.format_call_stack ());

  commit;
end ete_b;
/
