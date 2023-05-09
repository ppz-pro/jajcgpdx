{ equal, clone } = require '..'

test 'Number::get_array basic', ->
  result = ''
  (10).get_array (index) ->
    result += index
  expect(result).toBe '0123456789'
  
  expect(
    (10).get_array (index) -> index
    .join('')
  ).toBe '0123456789'

  raw = 3
  expect(
    raw.get_array (index) -> index
    .join(',')
  ).toBe '0,1,2'
  expect raw
  .toBe 3

test 'Number::get_array get_array', ->
  expect 1.get_array (index) -> index
  .toEqual [0]

  expect 6.get_array (index) -> index + 1
  .toEqual [1, 2, 3, 4, 5, 6]

  expect 3.get_array (index) -> { index }
  .toEqual [
    { index: 0 }
    { index: 1 }
    { index: 2 }
  ]

  expect 0.get_array()
  .toEqual []

  expect 3.get_array -> return
  .toEqual [undefined, undefined, undefined]

test 'Number::get_array throw error', ->
  expect -> 1.1.get_array()
  .toThrow 'Number::loop must be called by non-negative integer'
  expect -> 2.1.get_array()
  .toThrow 'Number::loop must be called by non-negative integer'
  expect -> (-1).get_array()
  .toThrow 'Number::loop must be called by non-negative integer'

  expect 1.get_array()
  .toEqual [0]

  expect 3.get_array()
  .toEqual [0, 1, 2]

  expect 0.get_array()
  .toEqual []

test 'Number::get_array practice', ->
  expect 10.get_array()
  .toEqual [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
