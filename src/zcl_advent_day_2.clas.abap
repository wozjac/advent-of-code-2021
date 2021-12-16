"! <p class="shorttext synchronized">Day 2: https://adventofcode.com/2021/day/2</p>
CLASS zcl_advent_day_2 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

    TYPES:
      day_2_input TYPE STANDARD TABLE OF char20 WITH EMPTY KEY,

      BEGIN OF commands,
        horizontal_position TYPE i,
        depth               TYPE i,
        aim                 TYPE i,
      END OF commands.

    METHODS:
      part_1 IMPORTING input         TYPE day_2_input
             RETURNING VALUE(result) TYPE i,

      part_2 IMPORTING input         TYPE day_2_input
             RETURNING VALUE(result) TYPE i.

ENDCLASS.



CLASS zcl_advent_day_2 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA(movements) = lcl_sample_data=>input.
    DATA(day_2) = NEW zcl_advent_day_2( ).

    out->write( |Position for part 1 is: { day_2->part_1( movements ) }| ).
    out->write( |Position for part 2 is: { day_2->part_2( movements ) }| ).

  ENDMETHOD.

  METHOD part_1.

    DATA(final_position) = REDUCE commands(
      INIT command = VALUE #( )
      FOR position IN input
      NEXT command-horizontal_position = command-horizontal_position + COND #(
             WHEN position CS 'forward' THEN substring( val = position off = strlen( position ) - 1 ) )
           command-depth = command-depth + COND #(
             WHEN position CS 'down' THEN CONV i( substring( val = position off = strlen( position ) - 1 ) )
             WHEN position CS 'up' THEN CONV i( substring( val = position off = strlen( position ) - 1 ) ) * -1 )
        ).

    result = final_position-depth * final_position-horizontal_position.

  ENDMETHOD.

  METHOD part_2.

    DATA(final_position) = REDUCE commands(
      INIT res = VALUE #( )
      FOR position IN input
      NEXT res-horizontal_position = res-horizontal_position + COND #(
             WHEN position CS 'forward' THEN substring( val = position off = strlen( position ) - 1 ) )
           res-aim = res-aim + COND #(
             WHEN position CS 'down' THEN CONV i( substring( val = position off = strlen( position ) - 1 ) )
             WHEN position CS 'up' THEN CONV i( substring( val = position off = strlen( position ) - 1 ) ) * -1 )
           res-depth = res-depth + res-aim * COND #(
             WHEN position CS 'forward' THEN substring( val = position off = strlen( position ) - 1 ) )
      ).

    result = final_position-depth * final_position-horizontal_position.

  ENDMETHOD.
ENDCLASS.
