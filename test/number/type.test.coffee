{ equal, clone } = require '..'

test 'Number::is_integer', ->
  expect 1.2.is_integer()
  .toBe false

  expect 1.is_integer()
  .toBe true

  expect 0.is_integer()
  .toBe true

  expect 0.1.is_integer()
  .toBe false

  expect (-2).is_integer()
  .toBe true
  # 符号优先级
  expect -2.is_integer()
  .toBe -1

  expect (-2.1).is_integer()
  .toBe false
  # 符号优先级
  expect -2.1.is_integer()
  .toBe -0

test 'Number::is_positive', ->
  expect 1.is_positive()
  .toBe true

  expect 100.is_positive()
  .toBe true

  expect (100 / 2).is_positive()
  .toBe true

  expect 1.1.is_positive()
  .toBe true

  expect 0.is_positive()
  .toBe false

  expect (-1).is_positive()
  .toBe false

  expect 0.00001.is_positive()
  .toBe true

  expect (-0.0001).is_positive()
  .toBe false

  expect 333.is_positive()
  .toBe true

  expect NaN.is_positive()
  .toBe false

test 'Number::non_negative', ->
  expect 1.non_negative()
  .toBe true

  expect 0.non_negative()
  .toBe true

  expect (-1).non_negative()
  .toBe false

  expect 100.non_negative()
  .toBe true

  expect 0.000003.non_negative()
  .toBe true

  expect (-0.0002).non_negative()
  .toBe false

  expect 10000000.non_negative()
  .toBe true
  
  expect NaN.non_negative()
  .toBe false

test 'Number::is_positiveInteger', ->
  expect 1.is_positiveInteger()
  .toBe true

  expect 1.1.is_positiveInteger()
  .toBe false

  expect 0.is_positiveInteger()
  .toBe false

  expect (-1).is_positiveInteger()
  .toBe false

  expect 2.is_positiveInteger()
  .toBe true

  expect NaN.is_positiveInteger()
  .toBe false
