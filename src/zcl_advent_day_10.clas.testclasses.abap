CLASS ltcl_unit_tests DEFINITION FINAL FOR TESTING
  DURATION LONG
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      setup,
      part_1 FOR TESTING RAISING cx_static_check,
      part_2 FOR TESTING RAISING cx_static_check.

    DATA:
      cut   TYPE REF TO zcl_advent_day_10,
      input TYPE zcl_advent_day_10=>lines.
ENDCLASS.



CLASS ltcl_unit_tests IMPLEMENTATION.

  METHOD setup.
    me->cut = NEW #( ).

    input = VALUE zcl_advent_day_10=>lines(
      ( `[({(<(())[]>[[{[]{<()<>>` )
      ( `[(()[<>])]({[<{<<[]>>(` )
      ( `{([(<{}[<>[]}>{[]{[(<()>` )
      ( `(((({<>}<{<{<>}{[]{[]{}` )
      ( `[[<[([]))<([[{}[[()]]]` )
      ( `[{[{({}]{}}([{[{{{}}([]` )
      ( `{<[[]]>}<{[{[{[]{()[[[]` )
      ( `[<(<(<(<{}))><([]([]()` )
      ( `<{([([[(<>()){}]>(<<{{` )
      ( `<{([{{}}[<[[[<>{}]]]>[]]` )
    ).
  ENDMETHOD.

  METHOD part_1.

    cl_abap_unit_assert=>assert_equals(
      exp = 26397
      act = me->cut->part_1( input ) ).

  ENDMETHOD.

  METHOD part_2.

    cl_abap_unit_assert=>assert_equals(
      exp = 288957
      act = me->cut->part_2( input ) ).

  ENDMETHOD.
ENDCLASS.
