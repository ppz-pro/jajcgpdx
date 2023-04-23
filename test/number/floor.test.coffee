{ equal, clone } = require '..'

test 'Number::floor', ->
  expect (6.88).floor()
  .toBe 6
