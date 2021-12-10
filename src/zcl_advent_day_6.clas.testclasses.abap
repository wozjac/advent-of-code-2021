CLASS ltcl_unit_tests DEFINITION FINAL FOR TESTING
  DURATION LONG
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      setup,
      part_1 FOR TESTING RAISING cx_static_check,
      part_2 FOR TESTING RAISING cx_static_check.

    DATA:
      cut TYPE REF TO zcl_advent_day_6.

ENDCLASS.


CLASS ltcl_unit_tests IMPLEMENTATION.

  METHOD setup.
    me->cut = NEW #( ).
  ENDMETHOD.

  METHOD part_1.

    DATA(input1) = VALUE zcl_advent_day_6=>lanterfish_stats( ( 3 ) ( 4 ) ( 3 ) ( 1 ) ( 2 ) ).

    cl_abap_unit_assert=>assert_equals(
      exp = 5934
      act = me->cut->part_1( input1 ) ).

  ENDMETHOD.

  METHOD part_2.

    DATA(input1) = VALUE zcl_advent_day_6=>lanterfish_stats( ( 3 ) ( 4 ) ( 3 ) ( 1 ) ( 2 ) ).

    cl_abap_unit_assert=>assert_equals(
      exp = 26984457539
      act = me->cut->part_2( input1 ) ).

  ENDMETHOD.

ENDCLASS.
