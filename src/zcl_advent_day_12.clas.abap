"! <p class="shorttext synchronized">Day 12: https://adventofcode.com/2021/day/12</p>
CLASS zcl_advent_day_12 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

    TYPES:
      input    TYPE STANDARD TABLE OF string WITH EMPTY KEY,
      node_ref TYPE REF TO data,
      path     TYPE STANDARD TABLE OF string,

      BEGIN OF node,
        label       TYPE string,
        is_large    TYPE abap_bool,
        connections TYPE STANDARD TABLE OF node_ref WITH EMPTY KEY,
      END OF node,

      BEGIN OF graph_item,
        label TYPE string,
        node  TYPE node,
      END OF graph_item,

      graph TYPE STANDARD TABLE OF graph_item.

    METHODS:
      part_1 IMPORTING input         TYPE input
             RETURNING VALUE(result) TYPE i.

  PRIVATE SECTION.
    METHODS:
      prepare_caves IMPORTING input TYPE input,

      make_connection CHANGING from TYPE node
                               to   TYPE node,

      make_node IMPORTING node_input    TYPE string
                RETURNING VALUE(result) TYPE node,

      count_paths IMPORTING node          TYPE node
                  CHANGING  path          TYPE path
                  RETURNING VALUE(result) TYPE i.
    DATA:
      caves TYPE graph.
ENDCLASS.



CLASS zcl_advent_day_12 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA(day1) = NEW zcl_advent_day_12( ).
    DATA(small_cave_paths) = day1->part_1( lcl_sample_data=>paths ).

    out->write( |Small cave paths { small_cave_paths } | ).

  ENDMETHOD.

  METHOD part_1.
    me->prepare_caves( input ).

    DATA path TYPE path.

    result = me->count_paths(
      EXPORTING
        node = me->caves[ label = 'start' ]-node
      CHANGING
        path = path ).

  ENDMETHOD.

  METHOD prepare_caves.
    LOOP AT input ASSIGNING FIELD-SYMBOL(<line>).
      SPLIT <line> AT '-' INTO TABLE DATA(parts).

      IF NOT line_exists( me->caves[ label = parts[ 1 ] ] ).
        DATA(node1) = me->make_node( parts[ 1 ] ).

        APPEND VALUE #(
          label = node1-label
          node = node1 )
          TO me->caves.
      ENDIF.

      IF NOT line_exists( me->caves[ label = parts[ 2 ] ] ).
        DATA(node2) = me->make_node( parts[ 2 ] ).

        APPEND VALUE #(
          label = node2-label
          node = node2 )
          TO me->caves.
      ENDIF.

      me->make_connection(
        CHANGING
          from = me->caves[ label = parts[ 1 ] ]-node
          to = me->caves[ label = parts[ 2 ] ]-node ).
    ENDLOOP.
  ENDMETHOD.

  METHOD make_node.
    result-label = node_input.
    result-is_large = COND #( WHEN to_upper( node_input ) = node_input THEN abap_true ELSE abap_false ).
  ENDMETHOD.

  METHOD make_connection.
    DATA: is_connected TYPE abap_bool,
          node         TYPE node.
    FIELD-SYMBOLS: <node> TYPE node.

    LOOP AT from-connections ASSIGNING FIELD-SYMBOL(<connection>).
      ASSIGN <connection>->* TO <node>.

      IF <node>-label = to-label.
        is_connected = abap_true.
        EXIT.
      ENDIF.
    ENDLOOP.

    IF is_connected = abap_false.
      APPEND REF #( to ) TO from-connections.
      APPEND REF #( from ) TO to-connections.
    ENDIF.

  ENDMETHOD.

  METHOD count_paths.
    FIELD-SYMBOLS: <node> TYPE node.

    IF node-label = 'end'.
      result = 1.
      RETURN.
    ENDIF.

    DATA(path_copy) = path.
    APPEND node-label TO path_copy.
    DATA(counter) = 0.

    LOOP AT node-connections ASSIGNING FIELD-SYMBOL(<connection>).
      ASSIGN <connection>->* TO <node>.

      IF <node>-is_large = abap_true OR NOT line_exists( path[ table_line = <node>-label ] ).
        counter += count_paths(
          EXPORTING
            node = <node>
          CHANGING
            path = path_copy
        ).
      ENDIF.
    ENDLOOP.

    result = counter.
  ENDMETHOD.
ENDCLASS.
