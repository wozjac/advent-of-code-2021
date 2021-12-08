CLASS ltcl_unit_test DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      setup,
      part_1 FOR TESTING RAISING cx_static_check,
      part_2 FOR TESTING RAISING cx_static_check.

    DATA:
      cut TYPE REF TO zcl_advent_day_3.

ENDCLASS.



CLASS ltcl_unit_test IMPLEMENTATION.

  METHOD setup.
    me->cut = NEW #( ).
  ENDMETHOD.

  METHOD part_1.

    DATA(input_1) = VALUE zcl_advent_day_3=>day_3_input(
      ( |110110000100| )
      ( |010110011100| )
      ( |001001101010| )
      ( |011011101010| )
      ( |101100010000| )
    ).

    " gamma   011110001000 1928
    " epsilon 100001110111 2167

    DATA(input_1_result) = me->cut->part_1( input_1 ).

    cl_abap_unit_assert=>assert_equals( exp = 4177976
                                        act = input_1_result ).

  ENDMETHOD.

  METHOD part_2.

    DATA(input_1) = VALUE zcl_advent_day_3=>day_3_input(
      ( |00100| )
      ( |11110| )
      ( |10110| )
      ( |10111| )
      ( |10101| )
      ( |01111| )
      ( |00111| )
      ( |11100| )
      ( |10000| )
      ( |11001| )
      ( |00010| )
      ( |01010| )
    ).

    DATA(input_1_result) = me->cut->part_2( input_1 ).

    cl_abap_unit_assert=>assert_equals(
      exp = 230
      act = input_1_result ).

  ENDMETHOD.
ENDCLASS.
