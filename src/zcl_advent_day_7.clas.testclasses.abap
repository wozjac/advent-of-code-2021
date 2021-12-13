CLASS ltcl_unit_tests DEFINITION FINAL FOR TESTING
  DURATION LONG
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      setup,
      part_1 FOR TESTING RAISING cx_static_check,
      part_2 FOR TESTING RAISING cx_static_check.

    DATA:
      cut TYPE REF TO zcl_advent_day_7.

ENDCLASS.



CLASS ltcl_unit_tests IMPLEMENTATION.

  METHOD setup.
    me->cut = NEW #( ).
  ENDMETHOD.

  METHOD part_1.

    DATA(input1) = VALUE zcl_advent_day_7=>crabs( ( 1 ) ( 2 ) ( 6 ) ( 7 ) ).

    cl_abap_unit_assert=>assert_equals(
      exp = 10
      act = me->cut->part_1( input1 ) ).

    DATA(input2) = VALUE zcl_advent_day_7=>crabs( ( 16 ) ( 1 ) ( 2 ) ( 0 ) ( 4 ) ( 2 )
      ( 7 ) ( 1 ) ( 2 ) ( 14 ) ).

    cl_abap_unit_assert=>assert_equals(
      exp = 37
      act = me->cut->part_1( input2 ) ).

  ENDMETHOD.

  METHOD part_2.

    DATA(input2) = VALUE zcl_advent_day_7=>crabs( ( 16 ) ( 1 ) ( 2 ) ( 0 ) ( 4 ) ( 2 )
      ( 7 ) ( 1 ) ( 2 ) ( 14 ) ).

    cl_abap_unit_assert=>assert_equals(
      exp = 168
      act = me->cut->part_2( input2 ) ).

  ENDMETHOD.

ENDCLASS.
