CLASS ltcl_unit_test DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      setup,
      part_1 FOR TESTING RAISING cx_static_check,
      part_2 FOR TESTING RAISING cx_static_check.

    DATA:
      cut TYPE REF TO zcl_advent_day_2.

ENDCLASS.


CLASS ltcl_unit_test IMPLEMENTATION.

  METHOD setup.
    me->cut = NEW #( ).
  ENDMETHOD.

  METHOD part_1.

    DATA(input_1) = VALUE zcl_advent_day_2=>day_2_input(
      ( 'forward 2' )
      ( 'down 5' )
      ( 'forward 1' )
      ( 'forward 2' )
      ( 'up 1' )
      ( 'up 2' )
      ( 'down 3' )
      ( 'down 1' )
    ).

    cl_abap_unit_assert=>assert_equals(
      exp = 30
      act = me->cut->part_1( input_1 ) ).

  ENDMETHOD.

  METHOD part_2.

    DATA(input_1) = VALUE zcl_advent_day_2=>day_2_input(
        ( 'forward 2' ) " h = 2 a = 0 d = 0
        ( 'down 5' )    " h = 2 a = 5 d = 0
        ( 'forward 1' ) " h = 3 a = 5 d = 5 * 1 = 5
        ( 'forward 2' ) " h = 5 a = 5 d = 5 + 5 * 2 = 15
        ( 'up 1' )      " h = 5 a = 5 d = 15
        ( 'up 2' )      " h = 5 a = 3 d = 15
        ( 'down 3' )    " h = 5 a = 6 d = 15
        ( 'down 1' )    " h = 5 a = 7 d = 15
      ).

    cl_abap_unit_assert=>assert_equals(
      exp = 75
      act = me->cut->part_2( input_1 ) ).

  ENDMETHOD.
ENDCLASS.
