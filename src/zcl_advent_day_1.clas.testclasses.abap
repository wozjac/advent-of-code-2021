CLASS ltcl_unit_tests DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      setup,
      part_1 FOR TESTING RAISING cx_static_check,
      part_2 FOR TESTING RAISING cx_static_check.

    DATA:
      cut TYPE REF TO zcl_advent_day_1.

ENDCLASS.


CLASS ltcl_unit_tests IMPLEMENTATION.

  METHOD setup.
    me->cut = NEW #( ).
  ENDMETHOD.

  METHOD part_1.

    DATA(input_1) = VALUE zcl_advent_day_1=>day_1_input( ( 1 ) ( 2 ) ( 3 ) ( 4 ) ( 5 ) ).
    DATA(input_1_result) = me->cut->part_1( input_1 ).

    cl_abap_unit_assert=>assert_equals(
      exp = 4
      act = input_1_result ).

    DATA(input_2) = VALUE zcl_advent_day_1=>day_1_input( ( 5 ) ( 4 ) ( 3 ) ( 2 ) ( 1 ) ).
    DATA(input_2_result) = me->cut->part_1( input_2 ).

    cl_abap_unit_assert=>assert_equals( exp = 0
                                        act = input_2_result ).

    DATA(input_3) = VALUE zcl_advent_day_1=>day_1_input( ( 1 ) ( 2 ) ( 1 ) ( 1 ) ( 2 ) ).
    DATA(input_3_result) = me->cut->part_1( input_3 ).

    cl_abap_unit_assert=>assert_equals(
      exp = 2
      act = input_3_result ).

  ENDMETHOD.

  METHOD part_2.

    DATA(input_1) = VALUE zcl_advent_day_1=>day_1_input( ( 1 ) ( 2 ) ( 3 ) ).
    DATA(input_1_result) = me->cut->part_2( input_1 ).

    cl_abap_unit_assert=>assert_equals(
      exp = 0
      act = input_1_result ).

    DATA(input_2) = VALUE zcl_advent_day_1=>day_1_input( ( 5 ) ( 4 ) ( 3 ) ( 2 ) ( 1 ) ( 1 ) ( 1 ) ( 2 ) ).
    DATA(input_2_result) = me->cut->part_2( input_2 ).

    cl_abap_unit_assert=>assert_equals(
      exp = 1
      act = input_2_result ).

    DATA(input_3) = VALUE zcl_advent_day_1=>day_1_input( ( 1 ) ( 2 ) ( 3 ) ( 4 ) ( 5 ) ( 6 ) ( 7 ) ( 8 ) ( 9 ) ).
    DATA(input_3_result) = me->cut->part_2( input_3 ).

    cl_abap_unit_assert=>assert_equals(
      exp = 6
      act = input_3_result ).

    DATA(input_4) = VALUE zcl_advent_day_1=>day_1_input( ( 1 ) ( 1 ) ( 1 ) ( 4 ) ).
    DATA(input_4_result) = me->cut->part_2( input_4 ).

    cl_abap_unit_assert=>assert_equals(
      exp = 1
      act = input_4_result ).

  ENDMETHOD.
ENDCLASS.
