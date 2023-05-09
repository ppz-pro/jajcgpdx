{ equal, clone } = require '..'

test 'Number::loop basic', ->
  result = ''
  (10).loop (index) ->
    result += index
  expect(result).toBe '0123456789'
  
  expect(
    (10).loop (index) -> index
    .join('')
  ).toBe '0123456789'

  raw = 3
  expect(
    raw.loop (index) -> index
    .join(',')
  ).toBe '0,1,2'
  expect raw
  .toBe 3

test 'Number::loop get_array', ->
  expect 1.loop (index) -> index
  .toEqual [0]

  expect 6.loop (index) -> index + 1
  .toEqual [1, 2, 3, 4, 5, 6]

  expect 3.loop (index) -> { index }
  .toEqual [
    { index: 0 }
    { index: 1 }
    { index: 2 }
  ]

  expect 0.loop()
  .toEqual []

  expect 3.loop -> return
  .toEqual [undefined, undefined, undefined]

test 'Number::loop throw error', ->
  expect -> 1.1.loop()
  .toThrow 'Number::loop must be called by non-negative integer'
  expect -> 2.1.loop()
  .toThrow 'Number::loop must be called by non-negative integer'
  expect -> (-1).loop()
  .toThrow 'Number::loop must be called by non-negative integer'

  expect -> 1.loop()
  .toThrow()
