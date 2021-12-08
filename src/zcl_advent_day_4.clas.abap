" https://adventofcode.com/2021/day/4
CLASS zcl_advent_day_4 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

    TYPES:
      drawings   TYPE STANDARD TABLE OF i WITH EMPTY KEY,
      board_line TYPE STANDARD TABLE OF i WITH EMPTY KEY,
      board      TYPE STANDARD TABLE OF board_line WITH EMPTY KEY,
      boards     TYPE STANDARD TABLE OF board WITH EMPTY KEY,

      BEGIN OF board_hits,
        row_hits    TYPE c LENGTH 5,
        column_hits TYPE c LENGTH 5,
      END OF board_hits,

      BEGIN OF won_board,
        board_number TYPE i,
        sum          TYPE i,
      END OF won_board,

      won_boards TYPE STANDARD TABLE OF won_board WITH KEY board_number.

    METHODS:
      part_1 IMPORTING drawings      TYPE drawings
                       boards        TYPE boards
             RETURNING VALUE(result) TYPE i,

      part_2 IMPORTING drawings      TYPE drawings
                       boards        TYPE boards
             RETURNING VALUE(result) TYPE i.

  PRIVATE SECTION.
    METHODS:
      game_on IMPORTING drawings      TYPE drawings
                        boards        TYPE boards
                        single_mode   TYPE abap_bool
              RETURNING VALUE(result) TYPE i.
ENDCLASS.



CLASS zcl_advent_day_4 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA(day1) = NEW zcl_advent_day_4( ).

    DATA(board_result) = day1->part_1(
      drawings = lcl_sample_data=>drawings
      boards = lcl_sample_data=>boards ).

    DATA(last_winning_board) = day1->part_2(
      drawings = lcl_sample_data=>drawings
      boards = lcl_sample_data=>boards ).

    out->write( |Result of the winner board is { board_result }| ).
    out->write( |The last winner board result is { last_winning_board }| ).

  ENDMETHOD.

  METHOD part_1.

    result = me->game_on(
      boards = boards
      drawings = drawings
      single_mode = abap_true ).

  ENDMETHOD.

  METHOD part_2.

    result = me->game_on(
      boards = boards
      drawings = drawings
      single_mode = abap_false ).

  ENDMETHOD.

  METHOD game_on.

    DATA(draw_count) = 1.
    DATA hits TYPE STANDARD TABLE OF board_hits WITH EMPTY KEY.
    DATA(processed_boards) = boards.

    DATA won_boards TYPE won_boards.

    DO lines( drawings ) TIMES.
      DATA(happy_number) = drawings[ draw_count ].

      LOOP AT processed_boards ASSIGNING FIELD-SYMBOL(<processed_board>).
        DATA(board_index) = sy-tabix.

        IF line_exists( won_boards[ board_number = board_index ] ).
          CONTINUE.
        ENDIF.

        IF NOT line_exists( hits[ board_index ] ).
          APPEND VALUE board_hits( row_hits = '00000' column_hits = '00000' ) TO hits.
        ENDIF.

        READ TABLE hits ASSIGNING FIELD-SYMBOL(<board_hits>) INDEX board_index.

        LOOP AT <processed_board> ASSIGNING FIELD-SYMBOL(<board_line>).
          DATA(board_line_index) = sy-tabix.

          IF line_exists( won_boards[ board_number = board_index ] ).
            EXIT.
          ENDIF.

          LOOP AT <board_line> ASSIGNING FIELD-SYMBOL(<value>).
            DATA(value_index) = sy-tabix.

            IF <value> = happy_number.
              <value> = -1.
              DATA(idx1) = board_line_index - 1.
              DATA(idx2) = value_index - 1.
              <board_hits>-row_hits+idx1(1) = <board_hits>-row_hits+idx1(1) + 1.
              <board_hits>-column_hits+idx2(1) = <board_hits>-column_hits+idx2(1) + 1.

              IF <board_hits>-row_hits CS '5' OR <board_hits>-column_hits CS '5'.
                DATA(sum) = REDUCE i(
                   INIT r = 0
                   FOR <b> IN <processed_board>
                   FOR <val> IN <b>
                   NEXT r = COND #( WHEN <val> <> -1 THEN r + <val> ELSE r + 0 )
                 ).

                INSERT VALUE #(
                  board_number = board_index
                  sum = sum * happy_number )
                  INTO TABLE won_boards.

                IF single_mode = abap_true.
                  result = sum * happy_number.
                  RETURN.
                ELSE.
                  EXIT.
                ENDIF.

              ENDIF.
            ENDIF.
          ENDLOOP.
        ENDLOOP.
      ENDLOOP.

      draw_count += 1.
    ENDDO.

    result = won_boards[ lines( won_boards ) ]-sum.

  ENDMETHOD.
ENDCLASS.
