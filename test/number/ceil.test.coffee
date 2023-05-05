{ equal, clone } = require '..'

test 'Number::floor', ->
  expect (6.88).ceil()
  .toBe 7

  expect (6).ceil()
  .toBe 6
  
  expect (-7.8).ceil()
  .toBe -7