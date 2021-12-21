"! <p class="shorttext synchronized">Day 13: https://adventofcode.com/2021/day/13</p>
CLASS zcl_advent_day_13 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

    TYPES:
      input TYPE STANDARD TABLE OF string WITH EMPTY KEY,

      BEGIN OF fold_coords,
        x TYPE i,
        y TYPE i,
      END OF fold_coords,

      fold_coords_tab TYPE STANDARD TABLE OF fold_coords WITH EMPTY KEY,
      dots_row        TYPE STANDARD TABLE OF x WITH EMPTY KEY,
      dots            TYPE STANDARD TABLE OF dots_row WITH EMPTY KEY,
      code            TYPE STANDARD TABLE OF string WITH EMPTY KEY.

    CLASS-DATA:
      out TYPE REF TO if_oo_adt_classrun_out.

    METHODS:
      part_1 IMPORTING input             TYPE input
                       start_fold_coords TYPE fold_coords
                       fold_by_x         TYPE abap_bool OPTIONAL
                       fold_by_y         TYPE abap_bool OPTIONAL
             RETURNING VALUE(result)     TYPE i,

      part_2 IMPORTING input       TYPE input
                       fold_coords TYPE fold_coords_tab,

      get_folded_on IMPORTING x               TYPE i OPTIONAL
                              y               TYPE i OPTIONAL
                              dots            TYPE dots
                    EXPORTING dots_after_fold TYPE dots
                              dots_count      TYPE i.
ENDCLASS.



CLASS zcl_advent_day_13 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA(day_13) = NEW zcl_advent_day_13( ).

    zcl_advent_day_13=>out = out.

    DATA(number_of_dots) = day_13->part_1(
      input = lcl_sample_data=>input
      fold_by_x = abap_true
      start_fold_coords = lcl_sample_data=>part_1_fold_coords ).

    out->write( |Number of dots: { number_of_dots }| ).

    day_13->part_2(
      input = lcl_sample_data=>input
      fold_coords = lcl_sample_data=>part_2_fold_coords ).

  ENDMETHOD.

  METHOD part_1.

    DATA(dots) = VALUE dots( FOR i = 0 UNTIL i > start_fold_coords-y * 2 ( VALUE #( FOR j = 0 UNTIL j > start_fold_coords-x * 2 ( ) ) ) ).

    LOOP AT input ASSIGNING FIELD-SYMBOL(<line>).
      SPLIT <line> AT ',' INTO TABLE DATA(parts).
      dots[ parts[ 2 ] + 1 ][ parts[ 1 ] + 1 ] = '1'.
    ENDLOOP.

    me->get_folded_on(
      EXPORTING
        x = COND #( WHEN fold_by_x = abap_true THEN start_fold_coords-x )
        y = COND #( WHEN fold_by_y = abap_true THEN start_fold_coords-y )
        dots = dots
      IMPORTING
        dots_after_fold = DATA(new_dots)
        dots_count = result ).

  ENDMETHOD.

  METHOD part_2.

    DATA(start_coords) = fold_coords[ 1 ].
    DATA(dots) = VALUE dots( FOR i = 0 UNTIL i > start_coords-y * 2 ( VALUE #( FOR j = 0 UNTIL j > start_coords-x * 2 ( ) ) ) ).

    LOOP AT input ASSIGNING FIELD-SYMBOL(<line>).
      SPLIT <line> AT ',' INTO TABLE DATA(parts).
      dots[ parts[ 2 ] + 1 ][ parts[ 1 ] + 1 ] = '1'.
    ENDLOOP.

    DATA(dots_copy) = dots.

    LOOP AT fold_coords ASSIGNING FIELD-SYMBOL(<coords>).

      me->get_folded_on(
        EXPORTING
          x = <coords>-x
          y = <coords>-y
          dots = dots_copy
        IMPORTING
          dots_after_fold = DATA(new_dots) ).

      dots_copy = new_dots.

    ENDLOOP.

    DATA code_line TYPE string.

    LOOP AT new_dots ASSIGNING FIELD-SYMBOL(<dot_line>).
      LOOP AT <dot_line> ASSIGNING FIELD-SYMBOL(<dot_col>).
        IF <dot_col> IS NOT INITIAL.
          code_line &&= '#'.
        ELSE .
          code_line &&= '.'.
        ENDIF.
      ENDLOOP.
      out->write( code_line ).
      CLEAR code_line.
    ENDLOOP.
  ENDMETHOD.

  METHOD get_folded_on.

    IF x IS NOT INITIAL AND y IS NOT INITIAL.
      DATA(cols) = x.
      DATA(rows) = y.
      DATA(from_y) = y + 2.
      DATA(to_x) = x.
      DATA(adjust_line_index) = y + 1.
    ELSEIF x IS INITIAL.
      rows = y.
      cols = lines( dots[ 1 ] ).
      from_y = y + 2.
      to_x = cols.
      adjust_line_index = y + 1.
    ELSEIF y IS INITIAL.
      rows = lines( dots ).
      cols = x.
      from_y = 1.
      to_x = x.
      adjust_line_index = 2.
    ENDIF.

    dots_after_fold = VALUE #( FOR i = 0 UNTIL i >= rows ( VALUE #( FOR j = 0 UNTIL j >= cols (  ) ) ) ).

    LOOP AT dots ASSIGNING FIELD-SYMBOL(<after_line>) FROM from_y.
      DATA(line) = sy-tabix.
      DATA(counter_x) = x * 2 + 1.
      DATA(adjust_line) = dots[ adjust_line_index - 1  ].

      LOOP AT adjust_line ASSIGNING FIELD-SYMBOL(<dot_column>) TO to_x.
        DATA(col) = sy-tabix.

        IF x IS NOT INITIAL AND y IS NOT INITIAL.
          DATA(dot_value) = <dot_column> BIT-OR <after_line>[ col ] BIT-OR adjust_line[ counter_x ] BIT-OR <after_line>[ counter_x ].
        ELSEIF x IS INITIAL.
          dot_value = <dot_column> BIT-OR <after_line>[ col ].
        ELSEIF y IS INITIAL.
          dot_value = <dot_column> BIT-OR <after_line>[ counter_x ].
        ENDIF.

        dots_count = COND #( WHEN dot_value = '10' THEN dots_count + 1 ELSE dots_count ).
        dots_after_fold[ adjust_line_index - 1 ][ col ] = dot_value.
        counter_x -= 1.
      ENDLOOP.

      IF y IS INITIAL.
        adjust_line_index += 1.
      ELSE.
        adjust_line_index -= 1.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
