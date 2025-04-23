CLASS zcl_as_func_abap DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.


    INTERFACES if_sadl_exit_calc_element_read .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_as_func_abap IMPLEMENTATION.


  METHOD if_sadl_exit_calc_element_read~calculate.

  data: lt_data_in type STANDARD TABLE OF ZI_AS_VIEW_ENTITY_AGENCY.

  lt_data_in = CORRESPONDING #(  it_original_data ).

  LOOP AT lt_data_in ASSIGNING FIELD-SYMBOL(<fs_data>).

  <fs_data>-AbapName = 'Anderson Santos'.

  ENDLOOP.

  ct_calculated_data = CORRESPONDING #( lt_data_in ).
  ENDMETHOD.


  METHOD if_sadl_exit_calc_element_read~get_calculation_info.
  ENDMETHOD.
ENDCLASS.
