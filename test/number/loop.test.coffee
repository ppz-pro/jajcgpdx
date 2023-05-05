{ equal, clone } = require '..'

test 'Number::loop', ->
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
