CLASS ltcl_unit_tests DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      setup,
      part_1 FOR TESTING RAISING cx_static_check,
      part_2 FOR TESTING RAISING cx_static_check.

    DATA:
      cut      TYPE REF TO zcl_advent_day_5.

ENDCLASS.


CLASS ltcl_unit_tests IMPLEMENTATION.

  METHOD setup.
    me->cut = NEW #( ).
  ENDMETHOD.

  METHOD part_1.

    DATA(input1) =
      '0,9 -> 5,9;' &&
      '8,0 -> 0,8;' &&
      '9,4 -> 3,4;' &&
      '2,2 -> 2,1;' &&
      '7,0 -> 7,4;' &&
      '6,4 -> 2,0;' &&
      '0,9 -> 2,9;' &&
      '3,4 -> 1,4;' &&
      '0,0 -> 8,8;' &&
      '5,5 -> 8,2;'.

    DATA(lines1) = lcl_sample_data=>convert(
      raw_data = input1
      xy_width = 1 ).

    cl_abap_unit_assert=>assert_equals(
      exp = 5
      act = me->cut->part_1( lines1 ) ).

    DATA(input2) =
      '10,100 -> 120,100;' &&
      '70,100 -> 500,100;'.

    DATA(lines2) = lcl_sample_data=>convert(
      raw_data = input2
      xy_width = 3 ).

    cl_abap_unit_assert=>assert_equals(
      exp = 51
      act = me->cut->part_1( lines2 ) ).

  ENDMETHOD.

  METHOD part_2.

    DATA(input1) =
      '0,9 -> 5,9;' &&
      '8,0 -> 0,8;' &&
      '9,4 -> 3,4;' &&
      '2,2 -> 2,1;' &&
      '7,0 -> 7,4;' &&
      '6,4 -> 2,0;' &&
      '0,9 -> 2,9;' &&
      '3,4 -> 1,4;' &&
      '0,0 -> 8,8;' &&
      '5,5 -> 8,2;'.

    DATA(lines1) = lcl_sample_data=>convert(
      raw_data = input1
      xy_width = 1 ).

    cl_abap_unit_assert=>assert_equals(
      exp = 12
      act = me->cut->part_2( lines1 ) ).

  ENDMETHOD.
ENDCLASS.
