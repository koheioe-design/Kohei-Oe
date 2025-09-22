"* sandbox for Dify review test
"* テスト用に1行追加   " ← このコメントを追加
"* テスト用に1行追加   " ← このコメントを追加
"* テスト用に1行追加   " ← このコメントを追加
"* テスト用に1行追加   " ← このコメントを追加
"* テスト用に1行追加   " ← このコメントを追加
"* テスト用に1行追加   " ← このコメントを追加
"* テスト用に1行追加   " ← このコメントを追加
"* テスト用に1行追加   " ← このコメントを追加
"* テスト用に1行追加   " ← このコメントを追加
SELECT * FROM sflight INTO TABLE @DATA(lt).
LOOP AT lt INTO DATA(l).
  WRITE: / l-carrid.
ENDLOOP.
