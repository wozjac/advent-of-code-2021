"! <p class="shorttext synchronized">Day 1: https://adventofcode.com/2021/day/1</p>
CLASS zcl_advent_day_1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

    TYPES:
      day_1_input TYPE STANDARD TABLE OF i WITH EMPTY KEY.

    METHODS:
      part_1 IMPORTING input         TYPE day_1_input
             RETURNING VALUE(result) TYPE i,

      part_2 IMPORTING input         TYPE day_1_input
             RETURNING VALUE(result) TYPE i.

ENDCLASS.



CLASS zcl_advent_day_1 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA(day_1) = NEW zcl_advent_day_1( ).

    out->write( |Number of increases: { day_1->part_1( lcl_sample_data=>input ) }| ).
    out->write( |Number of 3-measurement increases: { day_1->part_2( lcl_sample_data=>input ) }| ).

  ENDMETHOD.

  METHOD part_1.

    result = REDUCE i(
      INIT number_of_increases = 0
      FOR measure IN input INDEX INTO idx
      NEXT number_of_increases = COND #(
        WHEN idx = 1 THEN 0
        ELSE COND #( WHEN measure > input[ idx - 1 ] THEN number_of_increases + 1 ELSE number_of_increases )
      )
   ).

  ENDMETHOD.

  METHOD part_2.

    " 3-measurement sliding window
    DATA: sum      TYPE i,
          sum_prev TYPE i.

    LOOP AT input ASSIGNING FIELD-SYMBOL(<measure>) FROM 4.
      sum = input[ sy-tabix ] + input[ sy-tabix - 1 ] + input[ sy-tabix - 2 ].
      sum_prev = input[ sy-tabix - 1 ] + input[ sy-tabix - 2 ] + input[ sy-tabix - 3 ].

      IF sum > sum_prev.
        result += 1.
      ENDIF.

    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
