
feature/test-abap-review
* sandbox for Dify review test
SELECT carrid, connid, fldate FROM sflight INTO TABLE @DATA(lt).
LOOP AT lt INTO DATA(l).
  WRITE: / l-carrid.
ENDLOOP.

SELECT carrid, connid, fldate
  FROM sflight
  INTO TABLE @DATA(lt)
  WHERE carrid = 'LH'.         


*&---------------------------------------------------------------------*
*& Test Program for ABAP AI Review - Block and Warning Violations
*&---------------------------------------------------------------------*
REPORT ztest_review_violations.

" Block violation: Hard-coded password/sensitive data
CONSTANTS: lc_password TYPE string VALUE 'admin123',
           lc_api_key TYPE string VALUE 'sk-1234567890abcdef'.

" Warning: SELECT * without WHERE clause
SELECT *
  FROM sflight
  INTO TABLE @DATA(lt_all_flights).

" Block violation: SQL injection risk - dynamic WHERE clause
DATA: lv_user_input TYPE string VALUE 'LH'' OR ''1''=''1',
      lv_sql TYPE string.

lv_sql = |SELECT * FROM sflight WHERE carrid = '{ lv_user_input }'|.

" Warning: Missing error handling for database operations
SELECT carrid, connid, fldate
  FROM sflight
  INTO TABLE @DATA(lt_flights)
  WHERE carrid = 'LH'.

" Block violation: Deprecated statement usage
WRITE: / 'Flight data processing...'.
WRITE AT 20 'Total records:', lines( lt_flights ).

" Warning: Performance issue - nested SELECT in loop
LOOP AT lt_flights INTO DATA(ls_flight).
  SELECT SINGLE *
    FROM spfli
    INTO @DATA(ls_spfli)
    WHERE carrid = @ls_flight-carrid
      AND connid = @ls_flight-connid.
  
  " Block violation: Missing authorization check
  WRITE: / ls_flight-carrid, ls_flight-connid, ls_flight-fldate.
ENDLOOP.

" Warning: Unused variable
DATA: lv_unused_var TYPE i VALUE 42.

" Block violation: Direct system table access without authorization
SELECT *
  FROM usr02
  INTO TABLE @DATA(lt_users)
  UP TO 10 ROWS.

" Warning: Magic numbers without explanation
IF lines( lt_flights ) > 100.
  MESSAGE 'Too many flights' TYPE 'W'.
ELSEIF lines( lt_flights ) < 5.
  MESSAGE 'Insufficient data' TYPE 'E'.
ENDIF.

" Block violation: Potential memory issue - no UP TO clause for large tables
SELECT *
  FROM vbak
  INTO TABLE @DATA(lt_sales_orders).

" Warning: Non-standard naming convention
DATA: flight_data TYPE TABLE OF sflight,
      user_name TYPE string VALUE 'JohnDoe'.

" Block violation: Missing input validation
PARAMETERS: p_carrid TYPE s_carr_id.
SELECT *
  FROM sflight
  INTO TABLE @flight_data
  WHERE carrid = @p_carrid.

