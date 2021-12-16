"! <p class="shorttext synchronized">Day 6: https://adventofcode.com/2021/day/6</p>
CLASS zcl_advent_day_6 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

    TYPES:
      lanterfish_stats TYPE STANDARD TABLE OF i WITH EMPTY KEY.

    METHODS:
      part_1 IMPORTING input         TYPE lanterfish_stats
             RETURNING VALUE(result) TYPE int8,

      part_2 IMPORTING input         TYPE lanterfish_stats
             RETURNING VALUE(result) TYPE int8.

  PRIVATE SECTION.
    METHODS:
      calc_lanternfish_expansion IMPORTING input         TYPE lanterfish_stats
                                           days          TYPE i
                                 RETURNING VALUE(result) TYPE int8.

ENDCLASS.



CLASS zcl_advent_day_6 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA(day1) = NEW zcl_advent_day_6( ).
    DATA(lanterfish_after_80_days) = day1->part_1( lcl_sample_data=>lanternfish ).
    DATA(lanterfish_after_256_days) = day1->part_2( lcl_sample_data=>lanternfish ).

    out->write( |Lanternfish after 80 days { lanterfish_after_80_days } | ).
    out->write( |Lanternfish after 256 days { lanterfish_after_256_days } | ).

  ENDMETHOD.

  METHOD part_1.

    result = me->calc_lanternfish_expansion(
      input = input
      days = 80 ).

  ENDMETHOD.

  METHOD part_2.

    result = me->calc_lanternfish_expansion(
      input = input
      days = 256 ).

  ENDMETHOD.

  METHOD calc_lanternfish_expansion.

    TYPES stats TYPE STANDARD TABLE OF int8 WITH EMPTY KEY.

    DATA(fish_to_rebirth) = VALUE stats( FOR i = 1 UNTIL i > 10 (  ) ).

    LOOP AT input ASSIGNING FIELD-SYMBOL(<lanternfish_stat>).
      fish_to_rebirth[ <lanternfish_stat> + 1 ] += 1.
    ENDLOOP.

    DO days TIMES.
      fish_to_rebirth[ 8 ] += fish_to_rebirth[ 1 ].
      fish_to_rebirth[ 10 ] = fish_to_rebirth[ 1 ].

      DO 9 TIMES.
        fish_to_rebirth[ sy-index ] = fish_to_rebirth[ sy-index + 1 ].
      ENDDO.

      fish_to_rebirth[ 10 ] = 0.
    ENDDO.

    LOOP AT fish_to_rebirth ASSIGNING FIELD-SYMBOL(<value>).
      result += <value>.
    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
