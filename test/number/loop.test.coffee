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

test 'Number::loop throw error', ->
  expect -> 1.1.loop()
  .toThrow 'Number::loop must be called by non-negative integer'
  expect -> 2.1.loop()
  .toThrow 'Number::loop must be called by non-negative integer'
  expect -> (-1).loop()
  .toThrow 'Number::loop must be called by non-negative integer'

  expect -> 1.loop()
  .toThrow()
