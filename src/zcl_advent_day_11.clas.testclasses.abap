CLASS ltcl_unit_tests DEFINITION FINAL FOR TESTING
  DURATION LONG
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      setup,
      part_1 FOR TESTING RAISING cx_static_check.

    DATA:
      cut   TYPE REF TO zcl_advent_day_11,
      input TYPE zcl_advent_day_11=>energy_levels.
ENDCLASS.



CLASS ltcl_unit_tests IMPLEMENTATION.

  METHOD setup.
    me->cut = NEW #( ).

    input = VALUE zcl_advent_day_11=>energy_levels(
      ( VALUE #( ( 5 ) ( 4 ) ( 8 ) ( 3 ) ( 1 ) ( 4 ) ( 3 ) ( 2 ) ( 2 ) ( 3 ) ) )
      ( VALUE #( ( 2 ) ( 7 ) ( 4 ) ( 5 ) ( 8 ) ( 5 ) ( 4 ) ( 7 ) ( 1 ) ( 1 ) ) )
      ( VALUE #( ( 5 ) ( 2 ) ( 6 ) ( 4 ) ( 5 ) ( 5 ) ( 6 ) ( 1 ) ( 7 ) ( 3 ) ) )
      ( VALUE #( ( 6 ) ( 1 ) ( 4 ) ( 1 ) ( 3 ) ( 3 ) ( 6 ) ( 1 ) ( 4 ) ( 6 ) ) )
      ( VALUE #( ( 6 ) ( 3 ) ( 5 ) ( 7 ) ( 3 ) ( 8 ) ( 5 ) ( 4 ) ( 7 ) ( 8 ) ) )
      ( VALUE #( ( 4 ) ( 1 ) ( 6 ) ( 7 ) ( 5 ) ( 2 ) ( 4 ) ( 6 ) ( 4 ) ( 5 ) ) )
      ( VALUE #( ( 2 ) ( 1 ) ( 7 ) ( 6 ) ( 8 ) ( 4 ) ( 1 ) ( 7 ) ( 2 ) ( 1 ) ) )
      ( VALUE #( ( 6 ) ( 8 ) ( 8 ) ( 2 ) ( 8 ) ( 8 ) ( 1 ) ( 1 ) ( 3 ) ( 4 ) ) )
      ( VALUE #( ( 4 ) ( 8 ) ( 4 ) ( 6 ) ( 8 ) ( 4 ) ( 8 ) ( 5 ) ( 5 ) ( 4 ) ) )
      ( VALUE #( ( 5 ) ( 2 ) ( 8 ) ( 3 ) ( 7 ) ( 5 ) ( 1 ) ( 5 ) ( 2 ) ( 6 ) ) )
    ).
  ENDMETHOD.

  METHOD part_1.

    cl_abap_unit_assert=>assert_equals(
      exp = 1656
      act = me->cut->part_1( input ) ).

  ENDMETHOD.
ENDCLASS.
