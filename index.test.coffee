require('.')

test 'Array::sum', ->
  expect [1,2,3].sum()
  .toBe 6

test 'Array::product', ->
  expect [
    { value: 1 }
    { value: 2 }
    { value: 3 }
  ].product (item) -> item.value
  .toBe 6

test 'Array::ave', ->
  expect [1,2,3].ave()
  .toBe 2

# test 'Array::max', ->
#   expect []

test 'Array::isAsc', ->
  expect [1,2,2,3].isAsc()
  .toBe true
  
  expect [].isAsc()
  .toBe undefined
  
  expect [1,2,1,3].isAsc()
  .toBe false

test 'Array::isDesc', ->
  expect [3,2,1].isDesc()
  .toBe true

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
