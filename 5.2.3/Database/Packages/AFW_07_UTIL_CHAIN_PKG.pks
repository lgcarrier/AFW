SET DEFINE OFF;
create or replace package afw_07_util_chain_pkg
is
  --
  /*

  ***************************************************************************
  Header: ps_parse,v 1.0 00/11 12:00:00

         System  : HUMCUST
         Module  : HUMCUST.PS_PARSE
         Purpose : Parse data strings
         Author  : O'Reilly
  ***************************************************************************

  */
  --
  --
  --
  /*
  || PL/SQL table structures to hold atomics retrieved by parse_string.
  || This includes the table type definition, a table (though you can
  || declare your own as well, and an empty table, which you can use
  || to clear out your table which contains atomics.
  */
  type atoms_tabtype is table of varchar2 (32767)
    index by binary_integer;

  atoms_table         atoms_tabtype;
  empty_atoms_table   atoms_tabtype;
  /*
  || The standard list of delimiters. You can over-ride these with
  || your own list when you call the procedures and functions below.
  || This list is a pretty standard set of delimiters, though.
  */
  std_delimiters      varchar2 (50) := ' !@#$%^&*()-_=+\|`~{[]};:",<.>/?';

  /* Display contents of table using DBMS_OUTPUT */
  procedure display_atomics (table_in      in atoms_tabtype
                            ,num_rows_in   in number);

  /*
  || The parse_string procedure: I provide two, overloaded definitions.
  || The first version puts all atomics into a PL/SQL table and would
  || be used in a PL/SQL Version 2 environment. The second version places
  || all atomics into a string, separating each atomic by a vertical bar.
  || (My code does NOT do any special handling when it finds a "|" in
  || the string. You have to deal with that when you extract the atomics.
  ||
  || See the program definition for more details on other parameters.
  */
  procedure parse_string (string_in          in     varchar2
                         ,atomics_list_out      out atoms_tabtype
                         ,num_atomics_out    in out number
                         ,delimiters_in      in     varchar2 := std_delimiters);

  procedure parse_string (string_in          in     varchar2
                         ,atomics_list_out   in out varchar2
                         ,num_atomics_out    in out number
                         ,delimiters_in      in     varchar2 := std_delimiters);

  /* Count the number of atomics in a string */
  function number_of_atomics (string_in       in varchar2
                             ,count_type_in   in varchar2 := 'ALL'
                             ,delimiters_in   in varchar2 := std_delimiters)
    return integer;

  /* Return the Nth atomic in the string */
  function nth_atomic (string_in       in varchar2
                      ,nth_in          in number
                      ,count_type_in   in varchar2 := 'ALL'
                      ,delimiters_in   in varchar2 := std_delimiters)
    return varchar2;

  pragma restrict_references (number_of_atomics
                             ,wnds);
end afw_07_util_chain_pkg;
/
