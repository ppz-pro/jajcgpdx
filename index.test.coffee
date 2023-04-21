require('jajcgpdx')

test 'Array::sum', ->
  expect [1, 2, 3].sum()
  .toBe 6

test 'Array::product', ->
  expect [
    { value: 1 }
    { value: 2 }
    { value: 3 }
  ].product (item) -> item.value
  .toBe 6

test 'Array::ave', ->
  expect [1, 2, 3].ave()
  .toBe 2

# test 'Array::max', ->
#   expect []

test 'Number::loop', ->
  result = ''
  (10).loop (index) ->
    result += index
  expect(result).toBe '0123456789'
  
  expect(
    (10).loop (index) -> index
    .join('')
  ).toBe '0123456789'

test 'Number::floor', ->
  expect (6.88).floor()
  .toBe 6
