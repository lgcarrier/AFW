SET DEFINE OFF;
create or replace package body afw_07_util_chain_pkg
is
  /* Package variables used repeatedly throughout the body. */
  len_string         number;
  start_loc          number;
  next_loc           number;
  /*
  || Since the PUT_LINE procedure regards a string of one or more
  || spaces as NULL, it will not display a space, which is in
  || PS_Parse a valid atomic. So I save a_blank in the PL/SQL
  || table instead of the space itself.
  */
  a_blank   constant varchar2 (3) := '" "';

  /*--------------------- Private Modules ---------------------------
  || The following functions are available only to other modules in
  || package. No user of PS_Parse can see or use these functions.
  ------------------------------------------------------------------*/
  function a_delimiter (character_in    in varchar2
                       ,delimiters_in   in varchar2 := std_delimiters)
    return boolean /*
                   || Returns TRUE if the character passsed into the function is found
                   || in the list of delimiters.
                   */
  is
  begin
    return instr (delimiters_in
                 ,character_in) > 0;
  end;

  function string_length (string_in in varchar2)
    return integer
  is
  begin
    return length (ltrim (rtrim (string_in)));
  end;

  function next_atom_loc (string_in           in varchar2
                         ,start_loc_in        in number
                         ,scan_increment_in   in number := +1)
    /*
    || The next_atom_loc function returns the location
    || in the string of the starting point of the next atomic (from the
    || start location). The function scans forward if scan_increment_in is
    || +1, otherwise it scans backwards through the string. Here is the
    || logic to determine when the next atomic starts:
    ||
    ||      1. If current atomic is a delimiter (if, that is, the character
    ||         at the start_loc_in of the string is a delimiter), then the
    ||         the next character starts the next atomic since all
    ||         delimiters are a single character in length.
    ||
    ||      2. If current atomic is a word (if, that is, the character
    ||         at the start_loc_in of the string is a delimiter), then the
    ||         next atomic starts at the next delimiter. Any letters or
    ||         numbers in between are part of the current atomic.
    ||
    || So I loop through the string a character at a time and apply these
    || tests. I also have to check for end of string. If I scan forward
    || the end of string comes when the SUBSTR which pulls out the next
    || character returns NULL. If I scan backward, then the end of the
    || string comes when the location is less than 0.
    */
    return number
  is
    /* Boolean variable which uses private function to determine
    || if the current character is a delimiter or not.
    */
    was_a_delimiter   boolean
                        := a_delimiter (substr (string_in
                                               ,start_loc_in
                                               ,1));
    /* If not a delimiter, then it was a word. */
    was_a_word        boolean := not was_a_delimiter;
    /* The next character scanned in the string */
    next_char         varchar2 (1);
    /*
    || The value returned by the function. This location is the start
    || of the next atomic found. Initialize it to next character,
    || forward or backward depending on increment.
    */
    return_value      number := start_loc_in + scan_increment_in;
  begin
    loop
      -- Extract the next character.
      next_char      :=
        substr (string_in
               ,return_value
               ,1);
      -- Exit the loop if:
      exit when /* On a delimiter, since that is always an atomic */
               a_delimiter (next_char)
                or /* Was a delimiter, but am now in a word. */
                   (    was_a_delimiter
                    and not a_delimiter (next_char))
                or /* Reached end of string scanning forward. */
                  next_char is null
                or /* Reached beginning of string scanning backward. */
                  return_value < 0;
      /* Shift return_value to move the next character. */
      return_value   := return_value + scan_increment_in;
    end loop;

    -- If the return_value is negative, return 0, else the return_value
    return greatest (return_value
                    ,0);
  end;

  procedure increment_counter (counter_inout   in out number
                              ,count_type_in   in     varchar2
                              ,atomic_in       in     char) /*
                                                            || The increment_counter procedure is used by nth_atomic and
                                                            || number_of_atomics to add to the count of of atomics. Since you
                                                            || can request a count by ALL atomics, just the WORD atomics or
                                                            || just the DELIMITER atomics. I use the a_delimiter function to
                                                            || decide whether I should add to the counter. This is not a terribly
                                                            || complex procedure. I bury this logic into a separate module,
                                                        however,
                                                            || to make it easier to read and debug the main body of the programs.
                                                            */
  is
  begin
    if    count_type_in = 'ALL'
       or (    count_type_in = 'WORD'
           and not a_delimiter (atomic_in))
       or (    count_type_in = 'DELIMITER'
           and a_delimiter (atomic_in))
    then
      counter_inout   := counter_inout + 1;
    end if;
  end increment_counter;

  /* ------------------------- Public Modules -----------------------*/
  procedure display_atomics (table_in      in atoms_tabtype
                            ,num_rows_in   in number) /*
                                                      || Program to dump out contents of table. Notice I must also pass in
                                                      || the number of rows in the table so that I know when to stop the
                                                      || loop. Otherwise I will raise a NO_DATA_FOUND exception. For a more
                                                      || elaborate display_table module, see Chapter 7 on PL/SQL tables.
                                                      */
  is
  begin
    for table_row in 1 .. num_rows_in
    loop
      dbms_output.put_line (nvl (table_in (table_row), 'NULL'));
    end loop;
  end;

  procedure parse_string (string_in          in     varchar2
                         ,atomics_list_out      out atoms_tabtype
                         ,num_atomics_out    in out number
                         ,delimiters_in      in     varchar2 := std_delimiters) /*
                                                                                || Version of parse_string which stores the list of atomics
                                                                                || in a PL/SQL table.
                                                                                ||
                                                                                || Parameters:
                                                                                ||      string_in - the string to be parsed.
                                                                                ||      atomics_list_out - the table of atomics.
                                                                                ||      num_atomics_out - the number of atomics found.
                                                                                ||      delimiters_in - the set of delimiters used in parse.
                                                                                */
  is
  begin
    /* Initialize variables. */
    num_atomics_out   := 0;
    len_string        := string_length (string_in);

    if len_string is not null
    then
      /*
      || Only scan the string if made of something more than blanks.
      || Start at first non-blank character. Remember: INSTR returns 0
      || if a space is not found. Stop scanning if at end of string.
      */
      start_loc      :=
        least (1
              ,  instr (string_in
                       ,' ')
               + 1);

      while start_loc <= len_string
      loop
        /*
        || Find the starting point of the NEXT atomic. Go ahead and
        || increment counter for the number of atomics. Then have to
        || actually pull out the atomic. Two cases to consider:
        ||      1. Last atomic goes to end of string.
        ||      2. The atomic is a single blank. Use special constant.
        ||      3. Anything else.
        */
        next_loc          :=
          next_atom_loc (string_in
                        ,start_loc);
        num_atomics_out   := num_atomics_out + 1;

        if next_loc > len_string
        then
          -- Atomic is all characters right to the end of the string.
          atomics_list_out (num_atomics_out)      :=
            substr (string_in
                   ,start_loc);
        else
          /*
          || Internal atomic. If RTRIMs to NULL, have a blank
          || Use special-case string to stuff a " " in the table.
          */
          atomics_list_out (num_atomics_out)      :=
            nvl (rtrim (substr (string_in
                               ,start_loc
                               ,next_loc - start_loc))
                ,a_blank);
        end if;

        -- Move starting point of scan for next atomic.
        start_loc         := next_loc;
      end loop;
    end if;
  end parse_string;

  procedure parse_string (string_in          in     varchar2
                         ,atomics_list_out   in out varchar2
                         ,num_atomics_out    in out number
                         ,delimiters_in      in     varchar2 := std_delimiters) /*
                                                                                || The version of parse_string which writes the atomics out to a packed
                                                                                || list in the format "|A|,|C|". I do not repeat any of the comments
                                                                                || from the first iteration of parse_string.
                                                                                */
  is
  begin
    /* Initialize variables */
    num_atomics_out    := 0;
    atomics_list_out   := null;
    len_string         := string_length (string_in);

    if len_string is not null
    then
      start_loc      :=
        least (1
              ,  instr (string_in
                       ,' ')
               + 1);

      while start_loc <= len_string
      loop
        next_loc          :=
          next_atom_loc (string_in
                        ,start_loc);
        num_atomics_out   := num_atomics_out + 1;

        if next_loc > len_string
        then
          atomics_list_out      :=
               atomics_list_out
            || '|'
            || substr (string_in
                      ,start_loc);
        else
          atomics_list_out      :=
               atomics_list_out
            || '|'
            || nvl (rtrim (substr (string_in
                                  ,start_loc
                                  ,next_loc - start_loc))
                   ,a_blank);
        end if;

        start_loc         := next_loc;
      end loop;

      /* Apply terminating delimiter to the string. */
      atomics_list_out      :=
           atomics_list_out
        || '|';
    end if;
  end parse_string;

  function number_of_atomics (string_in       in varchar2
                             ,count_type_in   in varchar2 := 'ALL'
                             ,delimiters_in   in varchar2 := std_delimiters)
    return integer /*
                   || Counts the number of atomics in the string_in. You can specify the
                   || type of count you want: ALL for all atomics, WORD to count only the
                   || words and DELIMITER to count only the delimiters. You can optionally
                   || pass your own set of delimiters into the function.
                   */
  is
    return_value   integer := 0;
  begin
    /* Initialize variables. */
    len_string   := string_length (string_in);

    if len_string is not null
    then
      /*
      || This loop is much simpler than parse_string. Call the
      || next_atom_loc to move to the next atomic and increment the
      || counter if appropriate. Everything complicated is shifted into
      || sub-programs so that you can read the program "top-down",
      || understand it layer by layer.
      */
      start_loc      :=
        least (1
              ,  instr (string_in
                       ,' ')
               + 1);

      while start_loc <= len_string
      loop
        increment_counter (return_value
                          ,upper (count_type_in)
                          ,substr (string_in
                                  ,start_loc
                                  ,1));
        start_loc      :=
          next_atom_loc (string_in
                        ,start_loc);
      end loop;
    end if;

    return return_value;
  end number_of_atomics;

  function nth_atomic (string_in       in varchar2
                      ,nth_in          in number
                      ,count_type_in   in varchar2 := 'ALL'
                      ,delimiters_in   in varchar2 := std_delimiters)
    return varchar2 /*
                    || Find and return the nth atomic in a string. If nth_in is greater
                    || the number of atomics, then return NULL. If nth_in is negative the
                    || function counts from the back of the string. You can again request
                    || a retrieval by ALL atomics, just the WORDs or just the DELIMITER.
                    || So you can ask for the third atomic, or the second word from the end
                    || of the string. You can pass your own list of delimiters as well.
                    */
  is
    /* Local copy of string. Supports up to 1000 characters. */
    local_string     varchar2 (1000)
                       := ltrim (rtrim (substr (string_in
                                               ,1
                                               ,1000)));
    /* Running count of atomics so far counted. */
    atomic_count     number := 1;
    /* Boolean variable which controls the looping logic. */
    still_scanning   boolean
                       :=     local_string is not null
                          and nth_in != 0;
    /* The amount by which I increment the counter. */
    scan_increment   integer;
    /* Return value of function, maximum length of 100 characters. */
    return_value     varchar2 (100) := null;
  begin
    if nth_in = 0
    then
      /* Not much to do here. Find 0th atomic? */
      return null;
    else
      /* Initialize the loop variables. */
      len_string   := string_length (local_string);

      if nth_in > 0
      then
        /* Start at first non-blank character and scan forward. */
        next_loc         := 1;
        scan_increment   := 1;
      else
        /* Start at last non-blank character and scan backward. */
        next_loc         := len_string;
        scan_increment   := -1;
      end if;

      /* Loop through the string until the Boolean is FALSE. */
      while still_scanning
      loop
        /* Move start of scan in string to loc of last atomic. */
        start_loc   := next_loc;
        /* Find the starting point of the next atomic. */
        next_loc      :=
          next_atom_loc (local_string
                        ,start_loc
                        ,scan_increment);
        /* Increment the count of atomics. */
        increment_counter (atomic_count
                          ,upper (count_type_in)
                          ,substr (local_string
                                  ,start_loc
                                  ,1));
        /*
        || Keep scanning if my count hasn't exceeded the request
        || and I am neither at the beginning nor end of the string.
        */
        still_scanning      :=
              atomic_count <= abs (nth_in)
          and next_loc <= len_string
          and next_loc >= 1;
      end loop;

      /*
      || Done with the loop. If my count has not exceeded the requested
      || amount, then there weren't enough atomics in the string to
      || satisfy the request.
      */
      if atomic_count <= abs (nth_in)
      then
        return null;
      else
        /*
        || I need to extract the atomic from the string. If scanning
        || forward, then I start at start_loc and SUBSTR forward.
        || If I am scanning backwards, I start at next_loc+1 (next_loc
        || is the starting point of the NEXT atomic and I want the
        || current one) and SUBSTR forward (when scanning in
        || reverse, next_loc comes before start_loc in the string.
        */
        if scan_increment = +1
        then
          return substr (local_string
                        ,start_loc
                        ,next_loc - start_loc);
        else
          return substr (local_string
                        ,next_loc + 1
                        ,start_loc - next_loc);
        end if;
      end if;
    end if;
  end nth_atomic;
end afw_07_util_chain_pkg;
/
