SELECT carrid, connid, fldate
  FROM sflight
  INTO TABLE @DATA(lt)
  WHERE carrid = 'LH'.         
