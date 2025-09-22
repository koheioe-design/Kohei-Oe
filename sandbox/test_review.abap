"* sandbox for Dify review test
SELECT * FROM sflight INTO TABLE @DATA(lt).
LOOP AT lt INTO DATA(l).
  WRITE: / l-carrid, l-connid.  " ← connid を追加
ENDLOOP.
