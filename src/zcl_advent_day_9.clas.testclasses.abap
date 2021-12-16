CLASS ltcl_unit_tests DEFINITION FINAL FOR TESTING
  DURATION LONG
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      setup,
      part_1 FOR TESTING RAISING cx_static_check.

    DATA:
      cut     TYPE REF TO zcl_advent_day_9.

ENDCLASS.



CLASS ltcl_unit_tests IMPLEMENTATION.

  METHOD setup.
    me->cut = NEW #( ).
  ENDMETHOD.

  METHOD part_1.

    DATA(input_1) = VALUE zcl_advent_day_9=>points(
      ( VALUE #( ( 2 ) ( 1 ) ( 9 ) ( 9 ) ( 9 ) ( 4 ) ( 3 ) ( 2 ) ( 1 ) ( 0 )  ) )
      ( VALUE #( ( 3 ) ( 9 ) ( 8 ) ( 7 ) ( 8 ) ( 9 ) ( 4 ) ( 9 ) ( 2 ) ( 1 )  ) )
      ( VALUE #( ( 9 ) ( 8 ) ( 5 ) ( 6 ) ( 7 ) ( 8 ) ( 9 ) ( 8 ) ( 9 ) ( 2 )  ) )
      ( VALUE #( ( 8 ) ( 7 ) ( 6 ) ( 7 ) ( 8 ) ( 9 ) ( 6 ) ( 7 ) ( 8 ) ( 9 )  ) )
      ( VALUE #( ( 9 ) ( 8 ) ( 9 ) ( 9 ) ( 9 ) ( 6 ) ( 5 ) ( 6 ) ( 7 ) ( 8 )  ) )
    ).

    cl_abap_unit_assert=>assert_equals(
      exp = 15
      act = me->cut->part_1( input_1 ) ).

  ENDMETHOD.

ENDCLASS.
