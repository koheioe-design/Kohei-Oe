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

