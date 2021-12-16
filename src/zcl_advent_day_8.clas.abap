"! <p class="shorttext synchronized">Day 8: https://adventofcode.com/2021/day/8</p>
CLASS zcl_advent_day_8 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

    TYPES:
      display_stats TYPE STANDARD TABLE OF string WITH NON-UNIQUE DEFAULT KEY.

    METHODS:
      part_1 IMPORTING input         TYPE display_stats
             RETURNING VALUE(result) TYPE i.

  PRIVATE SECTION.
    METHODS:
      calculate_unique_output IMPORTING input         TYPE display_stats
                              RETURNING VALUE(result) TYPE i.

ENDCLASS.



CLASS zcl_advent_day_8 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA(day1) = NEW zcl_advent_day_8( ).
    DATA(result) = day1->part_1( lcl_sample_data=>display_data ).

    out->write( |Segments sum is { result } | ).

  ENDMETHOD.

  METHOD part_1.
    result = me->calculate_unique_output( input ).
  ENDMETHOD.

  METHOD calculate_unique_output.

    LOOP AT input ASSIGNING FIELD-SYMBOL(<line>).
      SPLIT <line> AT '|' INTO TABLE DATA(segments).
      SPLIT condense( segments[ 2 ] ) AT space INTO TABLE DATA(words).

      result += REDUCE i(
        INIT r = 0
        FOR <w> IN words
        NEXT r = SWITCH #( strlen( <w> )
          WHEN 2 OR 3 OR 4 OR 7
          THEN r + 1
          ELSE r + 0 )
      ).
    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
