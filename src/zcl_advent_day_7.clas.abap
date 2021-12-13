" https://adventofcode.com/2021/day/7
CLASS zcl_advent_day_7 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

    TYPES:
      crabs TYPE SORTED TABLE OF i WITH NON-UNIQUE DEFAULT KEY.

    METHODS:
      part_1 IMPORTING input         TYPE crabs
             RETURNING VALUE(result) TYPE i,

      part_2 IMPORTING input         TYPE crabs
             RETURNING VALUE(result) TYPE i.

  PRIVATE SECTION.
    METHODS:
      calculate_fuel_cost IMPORTING input         TYPE crabs
                                    advanced      TYPE abap_bool DEFAULT abap_false
                          RETURNING VALUE(result) TYPE i.

ENDCLASS.



CLASS zcl_advent_day_7 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA(day1) = NEW zcl_advent_day_7( ).
    DATA(fuel_cost_simple) = day1->part_1( lcl_sample_data=>crabs ).
    DATA(fuel_cost_advanced) = day1->part_2( lcl_sample_data=>crabs ).

    out->write( |Fuel cost is { fuel_cost_simple } | ).
    out->write( |Fuel cost is { fuel_cost_advanced } | ).

  ENDMETHOD.

  METHOD part_1.
    result = me->calculate_fuel_cost( input ).
  ENDMETHOD.

  METHOD part_2.

    result = me->calculate_fuel_cost(
      input = input
      advanced = abap_true ).

  ENDMETHOD.

  METHOD calculate_fuel_cost.

    IF advanced = abap_true.
      DATA(avg) = REDUCE decfloat16(
        INIT r = 0
        FOR <c> IN input
        NEXT r = r + <c>
      ) / lines( input ).

      DATA(avg_1) = round( val = avg dec = 0 mode = cl_abap_math=>round_up ).
      DATA(avg_2) = round( val = avg dec = 0 mode = cl_abap_math=>round_down ).

      DATA: sum_1 TYPE i,
            sum_2 TYPE i.

      LOOP AT input ASSIGNING FIELD-SYMBOL(<crab>).

        DATA(distance) = abs( <crab> - avg_1 ).
        sum_1 += ( distance * distance + distance ) / 2.
        distance = abs( <crab> - avg_2 ).
        sum_2 += ( distance * distance + distance ) / 2.

      ENDLOOP.

      IF sum_1 < sum_2.
        result = sum_1.
      ELSE.
        result = sum_2.
      ENDIF.
    ELSE.
      DATA(half) = input[ lines( input ) / 2 ].

      LOOP AT input ASSIGNING <crab>.
        result += abs( <crab> - half ).
      ENDLOOP.
    ENDIF.

  ENDMETHOD.
ENDCLASS.
