CLASS lcl_sample_data DEFINITION.
  PUBLIC SECTION.
    CLASS-DATA:
      " Day 12 real data
      paths TYPE zcl_advent_day_12=>input.

    CLASS-METHODS:
      class_constructor.

ENDCLASS.



CLASS lcl_sample_data IMPLEMENTATION.

  METHOD class_constructor.

    " From https://adventofcode.com/2021/day/12 input
    paths = VALUE #(
    ( `RT-start` )
    ( `bp-sq` )
    ( `em-bp` )
    ( `end-em` )
    ( `to-MW` )
    ( `to-VK` )
    ( `RT-bp` )
    ( `start-MW` )
    ( `to-hr` )
    ( `sq-AR` )
    ( `RT-hr` )
    ( `bp-to` )
    ( `hr-VK` )
    ( `st-VK` )
    ( `sq-end` )
    ( `MW-sq` )
    ( `to-RT` )
    ( `em-er` )
    ( `bp-hr` )
    ( `MW-em` )
    ( `st-bp` )
    ( `to-start` )
    ( `em-st` )
    ( `st-end` )
    ( `VK-sq` )
    ( `hr-st` )
    ).

  ENDMETHOD.
ENDCLASS.
