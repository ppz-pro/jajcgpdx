{ equal, clone } = require '..'

test 'Number::floor basic', ->
  expect (6.88).floor()
  .toBe 6

  expect (6).floor()
  .toBe 6

  expect (-7.6).floor()
  .toBe -8