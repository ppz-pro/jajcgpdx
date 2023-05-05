{ equal, clone } = require '..'

test 'Number::isInteger', ->
  expect 1.2.isInteger()
  .toBe false

  expect 1.isInteger()
  .toBe true

  expect 0.isInteger()
  .toBe true

  expect 0.1.isInteger()
  .toBe false

  expect (-2).isInteger()
  .toBe true
  # 符号优先级
  expect -2.isInteger()
  .toBe -1

  expect (-2.1).isInteger()
  .toBe false
  # 符号优先级
  expect -2.1.isInteger()
  .toBe -0

test 'Number::isPositive', ->
  expect 1.isPositive()
  .toBe true

  expect 100.isPositive()
  .toBe true

  expect (100 / 2).isPositive()
  .toBe true

  expect 1.1.isPositive()
  .toBe true

  expect 0.isPositive()
  .toBe false

  expect (-1).isPositive()
  .toBe false

  expect 0.00001.isPositive()
  .toBe true

  expect (-0.0001).isPositive()
  .toBe false

  expect 333.isPositive()
  .toBe true

  expect NaN.isPositive()
  .toBe false

test 'Number::nonNegative', ->
  expect 1.nonNegative()
  .toBe true

  expect 0.nonNegative()
  .toBe true

  expect (-1).nonNegative()
  .toBe false

  expect 100.nonNegative()
  .toBe true

  expect 0.000003.nonNegative()
  .toBe true

  expect (-0.0002).nonNegative()
  .toBe false

  expect 10000000.nonNegative()
  .toBe true
  
  expect NaN.nonNegative()
  .toBe false

test 'Number::isPositiveInteger', ->
  expect 1.isPositiveInteger()
  .toBe true

  expect 1.1.isPositiveInteger()
  .toBe false

  expect 0.isPositiveInteger()
  .toBe false

  expect (-1).isPositiveInteger()
  .toBe false

  expect 2.isPositiveInteger()
  .toBe true

  expect NaN.isPositiveInteger()
  .toBe false
