"! <p class="shorttext synchronized">Day 9: https://adventofcode.com/2021/day/9</p>
CLASS zcl_advent_day_9 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

    TYPES:
      points_row TYPE STANDARD TABLE OF i WITH EMPTY KEY,
      points     TYPE STANDARD TABLE OF points_row WITH EMPTY KEY.

    METHODS:
      part_1 IMPORTING input         TYPE points
             RETURNING VALUE(result) TYPE i.

  PRIVATE SECTION.
    METHODS:
      calculate_risk_level IMPORTING input         TYPE points
                           RETURNING VALUE(result) TYPE i,

      is_lowest IMPORTING input         TYPE points
                          x             TYPE i
                          y             TYPE i
                RETURNING VALUE(result) TYPE abap_bool.
ENDCLASS.



CLASS zcl_advent_day_9 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA(day1) = NEW zcl_advent_day_9( ).
    DATA(result) = day1->part_1( lcl_sample_data=>heightmap ).

    out->write( |Risk level is { result } | ).

  ENDMETHOD.

  METHOD part_1.
    result = me->calculate_risk_level( input ).
  ENDMETHOD.

  METHOD calculate_risk_level.

    DATA: x TYPE i,
          y TYPE i.

    LOOP AT input ASSIGNING FIELD-SYMBOL(<y>).
      y += 1.

      LOOP AT input[ y ] ASSIGNING FIELD-SYMBOL(<x>).
        x += 1.

        DATA(is_lowest) = is_lowest(
          input = input
          x = x
          y = y ).

        IF is_lowest = abap_true.
          result += input[ y ][ x ] + 1.
        ENDIF.
      ENDLOOP.

      x = 0.
    ENDLOOP.

  ENDMETHOD.

  METHOD is_lowest.

    DATA(checked_value) = input[ y ][ x ].

    IF checked_value < VALUE #( input[ y - 1 ][ x ] DEFAULT 99 )
      AND checked_value < VALUE #( input[ y + 1 ][ x ] DEFAULT 99 )
      AND checked_value < VALUE #( input[ y ][ x - 1 ] DEFAULT 99 )
      AND checked_value < VALUE #( input[ y ][ x + 1 ] DEFAULT 99 ).

      result = abap_true.
    ENDIF.

  ENDMETHOD.
ENDCLASS.
