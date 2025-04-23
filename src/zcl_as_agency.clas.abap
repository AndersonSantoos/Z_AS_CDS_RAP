CLASS zcl_as_agency DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  interfaces if_rap_query_provider.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_as_agency IMPLEMENTATION.
  METHOD if_rap_query_provider~select.

    "Filtros
     data(lv_filter) = io_request->get_filter(  )->get_as_sql_string(  ).

    "Paginação
     data(lo_paging) = io_request->get_paging(  ).


     if lo_paging IS BOUND.

     data(lv_offset) = lo_paging->get_offset( ).
     data(lv_top) = lo_paging->get_page_size(  ).

     if lv_top < 0.
        lv_top = 20.
     ENDIF.

     ENDIF.

     "Seleciona os dados
     SELECT from /dmo/agency
        FIELDS agency_id,
               name,
               street
     WHERE (lv_filter)
     order BY agency_id
     into table @data(lt_data)
     offset @lv_offset up to @lv_top ROWS.

     "Seta os dados
     IF sy-subrc = 0.

     io_response->set_data( lt_data ).

     if io_request->is_total_numb_of_rec_requested(  ).

        io_response->set_total_number_of_records( lines(  lt_data ) ).

     endif.
     endif.

  ENDMETHOD.

ENDCLASS.
