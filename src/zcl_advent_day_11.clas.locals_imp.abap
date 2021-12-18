CLASS lcl_sample_data DEFINITION.
  PUBLIC SECTION.
    CLASS-DATA:
      " Day 11 real data
      energy_levels        TYPE zcl_advent_day_11=>energy_levels.

    CLASS-METHODS:
      class_constructor.

ENDCLASS.



CLASS lcl_sample_data IMPLEMENTATION.

  METHOD class_constructor.

    " From https://adventofcode.com/2021/day/11 input
    energy_levels = VALUE #(
      ( VALUE #( ( 8 ) ( 5 ) ( 4 ) ( 8 ) ( 3 ) ( 3 ) ( 5 ) ( 6 ) ( 4 ) ( 4 )  ) )
      ( VALUE #( ( 6 ) ( 5 ) ( 7 ) ( 6 ) ( 5 ) ( 2 ) ( 1 ) ( 7 ) ( 8 ) ( 2 )  ) )
      ( VALUE #( ( 1 ) ( 2 ) ( 2 ) ( 3 ) ( 6 ) ( 7 ) ( 7 ) ( 7 ) ( 6 ) ( 2 )  ) )
      ( VALUE #( ( 1 ) ( 2 ) ( 8 ) ( 4 ) ( 7 ) ( 1 ) ( 3 ) ( 1 ) ( 1 ) ( 3 )  ) )
      ( VALUE #( ( 6 ) ( 1 ) ( 2 ) ( 5 ) ( 6 ) ( 5 ) ( 4 ) ( 7 ) ( 7 ) ( 8 )  ) )
      ( VALUE #( ( 6 ) ( 4 ) ( 3 ) ( 5 ) ( 7 ) ( 2 ) ( 6 ) ( 8 ) ( 4 ) ( 2 )  ) )
      ( VALUE #( ( 5 ) ( 6 ) ( 6 ) ( 4 ) ( 1 ) ( 7 ) ( 5 ) ( 5 ) ( 5 ) ( 6 )  ) )
      ( VALUE #( ( 1 ) ( 4 ) ( 4 ) ( 5 ) ( 7 ) ( 3 ) ( 6 ) ( 5 ) ( 5 ) ( 6 )  ) )
      ( VALUE #( ( 2 ) ( 2 ) ( 4 ) ( 8 ) ( 4 ) ( 7 ) ( 3 ) ( 5 ) ( 6 ) ( 8 )  ) )
      ( VALUE #( ( 6 ) ( 4 ) ( 5 ) ( 1 ) ( 4 ) ( 7 ) ( 3 ) ( 5 ) ( 2 ) ( 6 )  ) )
    ).

  ENDMETHOD.
ENDCLASS.
