CLASS ltcl_unit_tests DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      setup,
      part_1 FOR TESTING RAISING cx_static_check,
      part_2 FOR TESTING RAISING cx_static_check.

    DATA:
      cut      TYPE REF TO zcl_advent_day_4,
      drawings TYPE zcl_advent_day_4=>drawings,
      boards   TYPE zcl_advent_day_4=>boards.

ENDCLASS.


CLASS ltcl_unit_tests IMPLEMENTATION.

  METHOD setup.

    me->cut = NEW #( ).

    me->drawings = VALUE zcl_advent_day_4=>drawings(
      ( 10 ) ( 23 ) ( 6 ) ( 7 ) ( 4 ) ( 24 ) ( 17 ) ( 16 ) ( 15 ) ( 9 ) ( 19 ) ).

    DATA(board1) = VALUE zcl_advent_day_4=>board(
      ( VALUE #( ( 14 ) ( 21 ) ( 17 ) ( 24 ) ( 4 ) ) )
      ( VALUE #( ( 10 ) ( 76 ) ( 15 ) ( 9 ) ( 19 ) ) )
      ( VALUE #( ( 18 ) ( 8 ) ( 23 ) ( 26 ) ( 20 ) ) )
      ( VALUE #( ( 22 ) ( 11 ) ( 13 ) ( 6 ) ( 5 ) ) )
      ( VALUE #( ( 2 ) ( 0 ) ( 12 ) ( 3 ) ( 7 ) ) )
    ).

    DATA(board2) = VALUE zcl_advent_day_4=>board(
      ( VALUE #( ( 14 ) ( 21 ) ( 17 ) ( 24 ) ( 4 ) ) )
      ( VALUE #( ( 10 ) ( 16 ) ( 15 ) ( 9 ) ( 19 ) ) )
      ( VALUE #( ( 18 ) ( 8 ) ( 23 ) ( 26 ) ( 20 ) ) )
      ( VALUE #( ( 22 ) ( 11 ) ( 13 ) ( 6 ) ( 5 ) ) )
      ( VALUE #( ( 2 ) ( 0 ) ( 12 ) ( 3 ) ( 7 ) ) )
    ).

    me->boards = VALUE zcl_advent_day_4=>boards( ( board1 ) ( board2 ) ).

  ENDMETHOD.

  METHOD part_1.

    DATA(sum) = me->cut->part_1(
      boards = boards
      drawings = drawings ).

    cl_abap_unit_assert=>assert_equals(
      exp = 3325
      act = sum ).

  ENDMETHOD.

  METHOD part_2.

    DATA(sum) = me->cut->part_2(
     boards = boards
     drawings = drawings ).

    cl_abap_unit_assert=>assert_equals(
      exp = 3325
      act = sum ).

  ENDMETHOD.
ENDCLASS.
