"! <p class="shorttext synchronized">Day 10: https://adventofcode.com/2021/day/10</p>
CLASS zcl_advent_day_10 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

    TYPES:
      lines TYPE STANDARD TABLE OF string WITH EMPTY KEY.

    METHODS:
      part_1 IMPORTING input         TYPE lines
             RETURNING VALUE(result) TYPE i,

      part_2 IMPORTING input         TYPE lines
             RETURNING VALUE(result) TYPE int8.

  PRIVATE SECTION.
    METHODS:
      calculate_syntax_error IMPORTING input         TYPE lines
                             RETURNING VALUE(result) TYPE i,

      calculate_completion_score IMPORTING input         TYPE LINes
                                 RETURNING VALUE(result) TYPE int8,

      process_chunk CHANGING line TYPE string,

      find_invalid_close IMPORTING line          TYPE string
                         RETURNING VALUE(result) TYPE string.
ENDCLASS.



CLASS zcl_advent_day_10 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA(day1) = NEW zcl_advent_day_10( ).
    DATA(syntax_error_score) = day1->part_1( lcl_sample_data=>lines ).
    DATA(completion_score) = day1->part_2( lcl_sample_data=>lines ).

    out->write( |Syntax error score is { syntax_error_score } | ).
    out->write( |Completion score is { completion_score } | ).

  ENDMETHOD.

  METHOD part_1.
    result = me->calculate_syntax_error( input ).
  ENDMETHOD.

  METHOD part_2.
    result = me->calculate_completion_score( input ).
  ENDMETHOD.

  METHOD calculate_syntax_error.
    DATA(lines) = input.

    LOOP AT lines ASSIGNING FIELD-SYMBOL(<line>).
      DO.
        DATA(previous) = <line>.
        me->process_chunk( CHANGING line = <line> ).

        IF <line> IS INITIAL OR <line> = previous.
          IF <line> IS NOT INITIAL.
            DATA(invalid_close) = me->find_invalid_close( <line> ).

            IF invalid_close IS NOT INITIAL.
              result += SWITCH int8( invalid_close
                WHEN ')' THEN 3
                WHEN ']' THEN 57
                WHEN '}' THEN 1197
                WHEN '>' THEN 25137 ).

              CLEAR invalid_close.
              EXIT.
            ENDIF.

            EXIT.
          ENDIF.
        ENDIF.
      ENDDO.
    ENDLOOP.
  ENDMETHOD.

  METHOD process_chunk.
    REPLACE ALL OCCURRENCES OF REGEX '(\{\}|\(\)|\[\]|<>)' IN line WITH ''.
  ENDMETHOD.

  METHOD calculate_completion_score.
    DATA(lines) = input.
    DATA line_result TYPE int8.
    DATA lines_results TYPE SORTED TABLE OF int8 WITH UNIQUE KEY table_line.

    LOOP AT lines ASSIGNING FIELD-SYMBOL(<line>).
      CLEAR line_result.

      DO.
        DATA(previous) = <line>.
        me->process_chunk( CHANGING line = <line> ).

        IF <line> IS INITIAL OR <line> = previous.
          IF <line> IS NOT INITIAL.
            DATA(invalid_close) = me->find_invalid_close( <line> ).

            IF invalid_close IS INITIAL.
              DATA(counter) = strlen( <line> ) - 1.

              WHILE counter >= 0.
                DATA(sign) = <line>+counter(1).

                line_result = line_result * 5 + SWITCH i( sign
                  WHEN '(' THEN 1
                  WHEN '[' THEN 2
                  WHEN '{' THEN 3
                  WHEN '<' THEN 4
                ).

                <line> = <line>+0(counter).
                counter -= 1.
              ENDWHILE.

              EXIT.
            ENDIF.

            CLEAR invalid_close.
            EXIT.
          ENDIF.
        ENDIF.
      ENDDO.

      INSERT line_result INTO TABLE lines_results.
    ENDLOOP.

    result = lines_results[ ( lines( lines_results ) + 1 ) / 2 ].
  ENDMETHOD.

  METHOD find_invalid_close.

    FIND FIRST OCCURRENCE OF REGEX '(\}|\)|\]|>)' IN line RESULTS DATA(invalid_close).

    IF invalid_close IS NOT INITIAL.
      result = line+invalid_close-offset(1).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
