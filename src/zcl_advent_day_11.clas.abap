"! <p class="shorttext synchronized">Day 11: https://adventofcode.com/2021/day/11</p>
CLASS zcl_advent_day_11 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

    TYPES:
      energy_level  TYPE STANDARD TABLE OF i WITH EMPTY KEY,
      energy_levels TYPE STANDARD TABLE OF energy_level WITH EMPTY KEY,

      BEGIN OF x_y,
        x TYPE i,
        y TYPE i,
      END OF x_y,

      coords TYPE STANDARD TABLE OF x_y WITH EMPTY KEY.

    METHODS:
      part_1 IMPORTING input         TYPE energy_levels
             RETURNING VALUE(result) TYPE i.

  PRIVATE SECTION.
    METHODS:
      calculate_flash_sum IMPORTING input         TYPE energy_levels
                          RETURNING VALUE(result) TYPE i,

      scan IMPORTING x       TYPE i
                     y       TYPE i
           CHANGING  levels  TYPE energy_levels
                     flashes TYPE i.
ENDCLASS.



CLASS zcl_advent_day_11 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA(day1) = NEW zcl_advent_day_11( ).
    DATA(flashes_sum) = day1->part_1( lcl_sample_data=>energy_levels ).

    out->write( |Flashes sum is { flashes_sum } | ).

  ENDMETHOD.

  METHOD part_1.
    result = me->calculate_flash_sum( input ).
  ENDMETHOD.

  METHOD calculate_flash_sum.
    DATA(processed_levels) = input.
    DATA(x) = 0.
    DATA(y) = 0.

    DO 100 TIMES.
      x = 0.
      y = 0.

      WHILE y < lines( processed_levels ).
        y += 1.
        x = 0.

        WHILE x < lines( processed_levels[ y ] ).
          x += 1.
          processed_levels[ y ][ x ] += 1.
        ENDWHILE.
      ENDWHILE.

      x = 0.
      y = 0.

      WHILE y < lines( processed_levels ).
        y += 1.
        x = 0.

        WHILE x < lines( processed_levels[ y ] ).
          x += 1.

          me->scan(
            EXPORTING
              x = x
              y = y
            CHANGING
              levels = processed_levels
              flashes = result ).
        ENDWHILE.
      ENDWHILE.
    ENDDO.
  ENDMETHOD.

  METHOD scan.
    DATA coords TYPE coords.

    IF levels[ y ][ x ] = 10.
      levels[ y ][ x ] = 0.
      flashes += 1.

      APPEND VALUE #(
        x = x
        y = y - 1 )
        TO coords.

      APPEND VALUE #(
        x = x
        y = y + 1 )
        TO coords.

      APPEND VALUE #(
        x = x + 1
        y = y )
        TO coords.

      APPEND VALUE #(
        x = x - 1
        y = y )
        TO coords.

      APPEND VALUE #(
        x = x + 1
        y = y - 1 )
        TO coords.

      APPEND VALUE #(
        x = x + 1
        y = y + 1 )
        TO coords.

      APPEND VALUE #(
        x = x - 1
        y = y - 1 )
        TO coords.

      APPEND VALUE #(
        x = x - 1
        y = y + 1 )
        TO coords.

      LOOP AT coords ASSIGNING FIELD-SYMBOL(<coords>).
        DATA(value) = VALUE #( levels[ <coords>-y ][ <coords>-x ] DEFAULT -1 ).

        IF value <> -1 AND value <> 0.
          IF value = 10.
            levels[ <coords>-y ][ <coords>-x ] = value.
          ELSE.
            value += 1.
            levels[ <coords>-y ][ <coords>-x ] = value.

            me->scan(
              EXPORTING
                x = <coords>-x
                y = <coords>-y
              CHANGING
                levels = levels
                flashes = flashes ).

          ENDIF.
        ENDIF.
      ENDLOOP.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
