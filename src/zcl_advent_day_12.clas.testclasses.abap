CLASS ltcl_unit_tests DEFINITION FINAL FOR TESTING
  DURATION LONG
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      setup,
      part_1 FOR TESTING RAISING cx_static_check.

    DATA:
      cut   TYPE REF TO zcl_advent_day_12,
      input TYPE zcl_advent_day_12=>input.
ENDCLASS.



CLASS ltcl_unit_tests IMPLEMENTATION.

  METHOD setup.
    me->cut = NEW #( ).

    input = VALUE zcl_advent_day_12=>input(
      ( `start-A` )
      ( `start-b` )
      ( `A-c` )
      ( `A-b` )
      ( `b-d` )
      ( `A-end` )
      ( `b-end` )
    ).

*    input = VALUE zcl_advent_day_12=>input(
*      ( `start-a` )
*      ( `a-b` )
*      ( `c-a` )
*      ( `a-end` )
*    ).
  ENDMETHOD.

  METHOD part_1.

    cl_abap_unit_assert=>assert_equals(
      exp = 10
      act = me->cut->part_1( input ) ).

  ENDMETHOD.
ENDCLASS.
