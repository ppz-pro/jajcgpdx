{ equal, clone } = require '..'

test 'Date::format', ->
  expect new Date('2019-01-02 03:04:05').format() # 此日期由 copilot 生成
  .toBe '2019-01-02 03:04:05'
  
  expect new Date('2019-01-22 13:04:05').format()
  .toBe '2019-01-22 13:04:05'

  expect new Date('2019-01-31 13:04:05').format()
  .toBe '2019-01-31 13:04:05'
