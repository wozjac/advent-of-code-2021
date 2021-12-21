CLASS ltcl_unit_tests DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      setup,
      part_1_by_x_y FOR TESTING RAISING cx_static_check,
      part_1_by_y FOR TESTING RAISING cx_static_check,
      part_1_by_x FOR TESTING RAISING cx_static_check.

    DATA:
      cut   TYPE REF TO zcl_advent_day_13,
      input TYPE zcl_advent_day_13=>input.

ENDCLASS.


CLASS ltcl_unit_tests IMPLEMENTATION.

  METHOD setup.
    me->cut = NEW #( ).

    me->input = VALUE #(
      ( `6,10` )
      ( `0,14` )
      ( `9,10` )
      ( `0,3` )
      ( `10,4` )
      ( `4,11` )
      ( `6,0` )
      ( `6,12` )
      ( `4,1` )
      ( `0,13` )
      ( `10,12` )
      ( `3,4` )
      ( `3,0` )
      ( `8,4` )
      ( `1,10` )
      ( `2,14` )
      ( `8,10` )
      ( `9,0` )
    ).

  ENDMETHOD.

  METHOD part_1_by_y.

    cl_abap_unit_assert=>assert_equals(
      exp = 17
      act = me->cut->part_1(
        input = input
        fold_by_x = abap_false
        fold_by_y = abap_true
        start_fold_coords = VALUE #( x = 5 y = 7 ) ) ).

  ENDMETHOD.

  METHOD part_1_by_x.

    cl_abap_unit_assert=>assert_equals(
      exp = 17
      act = me->cut->part_1(
        input = input
        fold_by_x = abap_true
        fold_by_y = abap_false
        start_fold_coords = VALUE #( x = 5 y = 7 ) ) ).

  ENDMETHOD.

  METHOD part_1_by_x_y.

    cl_abap_unit_assert=>assert_equals(
      exp = 16
      act = me->cut->part_1(
        input = input
        fold_by_x = abap_true
        fold_by_y = abap_true
        start_fold_coords = VALUE #( x = 5 y = 7 ) ) ).

  ENDMETHOD.
ENDCLASS.
