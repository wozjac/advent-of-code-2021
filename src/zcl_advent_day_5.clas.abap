"! <p class="shorttext synchronized">Day 5: https://adventofcode.com/2021/day/5</p>
CLASS zcl_advent_day_5 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

    TYPES:
      BEGIN OF coordinates,
        start TYPE string,
        end   TYPE string,
      END OF coordinates,

      BEGIN OF lines,
        coords   TYPE STANDARD TABLE OF coordinates WITH EMPTY KEY,
        xy_width TYPE i,
      END OF lines.

    METHODS:
      part_1 IMPORTING input         TYPE lines
             RETURNING VALUE(result) TYPE i,

      part_2 IMPORTING input         TYPE lines
             RETURNING VALUE(result) TYPE i.

  PRIVATE SECTION.
    METHODS:
      calculate_dangerous_vents IMPORTING lines              TYPE lines
                                          crossed_in_all_dir TYPE abap_bool DEFAULT abap_false
                                RETURNING VALUE(result)      TYPE i.

ENDCLASS.



CLASS zcl_advent_day_5 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA(day1) = NEW zcl_advent_day_5( ).
    DATA(dangerous_vents_hor_ver) = day1->part_1( lcl_sample_data=>lines ).
    DATA(dangerous_vents_all) = day1->part_2( lcl_sample_data=>lines ).

    out->write( |Dangerous vents number (horizontal and vertical): { dangerous_vents_hor_ver }| ).
    out->write( |Dangerous vents number (all): { dangerous_vents_all }| ).

  ENDMETHOD.

  METHOD part_1.

    result = me->calculate_dangerous_vents( input ).

  ENDMETHOD.

  METHOD part_2.

    result = me->calculate_dangerous_vents(
      lines = input
      crossed_in_all_dir = abap_true ).

  ENDMETHOD.

  METHOD calculate_dangerous_vents.

    TYPES: hit_line  TYPE STANDARD TABLE OF i WITH EMPTY KEY,
           hit_board TYPE STANDARD TABLE OF hit_line WITH EMPTY KEY.

    DATA(size) = ipow( base = 10 exp = lines-xy_width ).
    DATA(hit_board) = VALUE hit_board( FOR i = 0 UNTIL i >= size ( VALUE #( FOR j = 0 UNTIL j >= size ( 0 ) ) ) ).

    LOOP AT lines-coords ASSIGNING FIELD-SYMBOL(<coordinates>).
      SPLIT <coordinates>-start AT ',' INTO TABLE DATA(xy1_start_coords).
      SPLIT <coordinates>-end AT ',' INTO TABLE DATA(xy2_end_coords).

      DATA(x1) = CONV i( xy1_start_coords[ 1 ] ) + 1.
      DATA(y1) = CONV i( xy1_start_coords[ 2 ] ) + 1.
      DATA(x2) = CONV i( xy2_end_coords[ 1 ] ) + 1.
      DATA(y2) = CONV i( xy2_end_coords[ 2 ] ) + 1.

      IF x1 = x2 AND y1 <> y2.
        hit_board[ x1 ][ y1 ] += 1.

        IF hit_board[ x1 ][ y1 ] = 2.
          result += 1.
        ENDIF.

        IF y1 > y2.
          DATA(slide) = -1.
        ELSE.
          slide = 1.
        ENDIF.

        WHILE y1 <> y2.
          y1 += slide.
          hit_board[ x1 ][ y1 ] += 1.

          IF hit_board[ x1 ][ y1 ] = 2.
            result += 1.
          ENDIF.

        ENDWHILE.

      ELSEIF y1 = y2 AND x1 <> x2.
        hit_board[ x1 ][ y1 ] += 1.

        IF hit_board[ x1 ][ y1 ] = 2.
          result += 1.
        ENDIF.

        IF x1 > x2.
          slide = -1.
        ELSE.
          slide = 1.
        ENDIF.

        WHILE x1 <> x2.
          x1 += slide.
          hit_board[ x1 ][ y1 ] += 1.

          IF hit_board[ x1 ][ y1 ] = 2.
            result += 1.
          ENDIF.

        ENDWHILE.

      ELSEIF crossed_in_all_dir = abap_true.
        hit_board[ x1 ][ y1 ] += 1.

        IF hit_board[ x1 ][ y1 ] = 2.
          result += 1.
        ENDIF.

        IF x1 > x2.
          DATA(slide_x) = -1.
        ELSE.
          slide_x = 1.
        ENDIF.

        IF y1 > y2.
          DATA(slide_y) = -1.
        ELSE.
          slide_y = 1.
        ENDIF.

        WHILE x1 <> x2.
          x1 += slide_x.
          y1 += slide_y.
          hit_board[ x1 ][ y1 ] += 1.

          IF hit_board[ x1 ][ y1 ] = 2.
            result += 1.
          ENDIF.

        ENDWHILE.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
