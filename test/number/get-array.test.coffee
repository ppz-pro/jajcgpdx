{ equal, clone } = require '..'

test 'Number::getArray basic', ->
  result = ''
  (10).getArray (index) ->
    result += index
  expect(result).toBe '0123456789'
  
  expect(
    (10).getArray (index) -> index
    .join('')
  ).toBe '0123456789'

  raw = 3
  expect(
    raw.getArray (index) -> index
    .join(',')
  ).toBe '0,1,2'
  expect raw
  .toBe 3

test 'Number::getArray getArray', ->
  expect 1.getArray (index) -> index
  .toEqual [0]

  expect 6.getArray (index) -> index + 1
  .toEqual [1, 2, 3, 4, 5, 6]

  expect 3.getArray (index) -> { index }
  .toEqual [
    { index: 0 }
    { index: 1 }
    { index: 2 }
  ]

  expect 0.getArray()
  .toEqual []

  expect 3.getArray -> return
  .toEqual [undefined, undefined, undefined]

test 'Number::getArray throw error', ->
  expect -> 1.1.getArray()
  .toThrow 'Number::loop must be called by non-negative integer'
  expect -> 2.1.getArray()
  .toThrow 'Number::loop must be called by non-negative integer'
  expect -> (-1).getArray()
  .toThrow 'Number::loop must be called by non-negative integer'

  expect 1.getArray()
  .toEqual [0]

  expect 3.getArray()
  .toEqual [0, 1, 2]

  expect 0.getArray()
  .toEqual []

test 'Number::getArray practice', ->
  expect 10.getArray()
  .toEqual [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
