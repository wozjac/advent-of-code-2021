" https://adventofcode.com/2021/day/3
CLASS zcl_advent_day_3 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

    TYPES:
      day_3_input TYPE STANDARD TABLE OF string WITH EMPTY KEY,

      BEGIN OF diagnostic_params,
        gamma   TYPE i,
        epsilon TYPE i,
      END OF diagnostic_params.

    METHODS:
      part_1 IMPORTING input         TYPE day_3_input
             RETURNING VALUE(result) TYPE i,

      part_2 IMPORTING input         TYPE day_3_input
             RETURNING VALUE(result) TYPE i,

      invert IMPORTING report        TYPE day_3_input
             RETURNING VALUE(result) TYPE day_3_input.

  PRIVATE SECTION.
    METHODS:
      calculate_gamma_and_epsilon IMPORTING report  TYPE day_3_input
                                  EXPORTING gamma   TYPE string
                                            epsilon TYPE string,

      calculate_common_bit_mask IMPORTING report        TYPE day_3_input
                                          most          TYPE abap_bool
                                RETURNING VALUE(result) TYPE string,

      calculate_power_consumption IMPORTING gamma         TYPE string
                                            epsilon       TYPE string
                                  RETURNING VALUE(result) TYPE i,

      calculate_life_support IMPORTING report        TYPE day_3_input
                             RETURNING VALUE(result) TYPE i,

      make_pattern IMPORTING length        TYPE i
                   RETURNING VALUE(result) TYPE string,

      convert_to_xstring IMPORTING input         TYPE string
                         RETURNING VALUE(result) TYPE xstring.
ENDCLASS.



CLASS zcl_advent_day_3 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA(diagnostic_data) = lcl_sample_data=>input.
    DATA(day3) = NEW zcl_advent_day_3( ).

    out->write( |Power consumption is { day3->part_1( diagnostic_data ) }| ).
    out->write( |Life support is { day3->part_2( diagnostic_data ) }| ).

  ENDMETHOD.

  METHOD part_1.

    DATA(report_inverted) = me->invert( input ).

    me->calculate_gamma_and_epsilon(
      EXPORTING
        report = report_inverted
      IMPORTING
        gamma = DATA(gamma)
        epsilon = DATA(epsilon) ).

    result = me->calculate_power_consumption(
      gamma = gamma
      epsilon = epsilon ).

  ENDMETHOD.

  METHOD part_2.

    result = me->calculate_life_support( input ).

  ENDMETHOD.

  METHOD calculate_gamma_and_epsilon.

    LOOP AT report ASSIGNING FIELD-SYMBOL(<report_line>).
      FIND ALL OCCURRENCES OF '1' IN <report_line> MATCH COUNT DATA(ones_count).
      DATA(zeros_count) = strlen( <report_line> ) - ones_count.

      IF ones_count >= zeros_count.
        gamma &&= '1'.
        epsilon &&= '0'.
      ELSE.
        gamma &&= '0'.
        epsilon &&= '1'.
      ENDIF.

    ENDLOOP.

  ENDMETHOD.

  METHOD invert.

    DATA: report_parameter_length TYPE i,
          counter                 TYPE i.

    LOOP AT report ASSIGNING FIELD-SYMBOL(<parameter>).
      report_parameter_length = strlen( <parameter> ).
      counter = 0.

      DO report_parameter_length TIMES.
        DATA(char) = <parameter>+counter(1).

        READ TABLE result ASSIGNING FIELD-SYMBOL(<report_line>) INDEX counter + 1.

        IF <report_line> IS NOT ASSIGNED.
          APPEND char TO result.
        ELSE.
          <report_line> &&= char.
        ENDIF.

        counter += 1.
      ENDDO.
    ENDLOOP.

  ENDMETHOD.

  METHOD calculate_power_consumption.

    result = CONV i( convert_to_xstring( gamma ) ) * CONV i( convert_to_xstring( epsilon ) ).

  ENDMETHOD.

  METHOD calculate_life_support.

    DATA: exit    TYPE abap_bool,
          counter TYPE i.

    DATA(reduced_oxygen_report) = report.
    DATA(reduced_co2_report) = report.

    WHILE exit = abap_false.
      DATA(inverted_oxygen_report) = me->invert( reduced_oxygen_report ).
      DATA(inverted_co2_report) = me->invert( reduced_co2_report ).

      DATA(current_gamma) = me->calculate_common_bit_mask(
        report = inverted_oxygen_report
        most = abap_true ).

      DATA(current_epsilon) = me->calculate_common_bit_mask(
        report = inverted_co2_report
        most = abap_false ).

      DATA(most_common_bit) = current_gamma+counter(1).
      DATA(least_common_bit) = current_epsilon+counter(1).
      DATA(oxygen_pattern) = make_pattern( strlen( current_gamma ) ).
      DATA(co2_pattern) = make_pattern( strlen( current_epsilon ) ).
      REPLACE SECTION OFFSET counter LENGTH 1 OF oxygen_pattern WITH most_common_bit.
      REPLACE SECTION OFFSET counter LENGTH 1 OF co2_pattern WITH least_common_bit.

      DATA(oxygen_report_length) = lines( reduced_oxygen_report ).
      DATA(co2_report_length) = lines( reduced_co2_report ).

      IF oxygen_report_length > 1.
        DATA(oxygen_report_aux) = reduced_oxygen_report.
        DELETE reduced_oxygen_report WHERE table_line NP oxygen_pattern.

        IF lines( reduced_oxygen_report ) * 2 = lines( oxygen_report_aux ).
          reduced_oxygen_report = oxygen_report_aux.
          REPLACE SECTION OFFSET counter LENGTH 1 OF oxygen_pattern WITH '1'.
          DELETE reduced_oxygen_report WHERE table_line NP oxygen_pattern.
        ENDIF.

      ENDIF.

      IF co2_report_length > 1.
        DATA(co2_report_aux) = reduced_co2_report.
        DELETE reduced_co2_report WHERE table_line NP co2_pattern.

        IF lines( reduced_co2_report ) * 2 = lines( co2_report_aux ).
          reduced_co2_report = co2_report_aux.
          REPLACE SECTION OFFSET counter LENGTH 1 OF co2_pattern WITH '0'.
          DELETE reduced_co2_report WHERE table_line NP co2_pattern.
        ENDIF.

      ENDIF.

      counter += 1.

      IF lines( reduced_oxygen_report ) = 1 AND lines( reduced_co2_report ) = 1.
        exit = abap_true.
      ENDIF.
    ENDWHILE.

    DATA(final_oxygen) = CONV string( reduced_oxygen_report[ 1 ] ).
    DATA(final_co2) = CONV string( reduced_co2_report[ 1 ] ).

    result = CONV i( convert_to_xstring( final_oxygen ) ) * CONV i( convert_to_xstring( final_co2 ) ).

  ENDMETHOD.

  METHOD make_pattern.

    DO length TIMES.
      result &&= '+'.
    ENDDO.

  ENDMETHOD.

  METHOD convert_to_xstring.

    DATA counter     TYPE i.
    DATA(length) = strlen( input ).

    WHILE counter < length.
      IF length > 8.
        DATA(byte_offset) = length + sy-index.
      ELSE.
        byte_offset = 8 - length + sy-index.
      ENDIF.

      result = result BIT-OR boolx( bool = input+counter(1) = '1' bit = byte_offset ).
      counter += 1.
    ENDWHILE.

  ENDMETHOD.

  METHOD calculate_common_bit_mask.

    LOOP AT report ASSIGNING FIELD-SYMBOL(<report_line>).
      FIND ALL OCCURRENCES OF '1' IN <report_line> MATCH COUNT DATA(ones_count).
      DATA(zeros_count) = strlen( <report_line> ) - ones_count.

      IF most = abap_true.
        IF ones_count >= zeros_count.
          result &&= '1'.
        ELSE.
          result &&= '0'.
        ENDIF.
      ELSE.
        IF zeros_count <= ones_count.
          result &&= '0'.
        ELSE.
          result &&= '1'.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
