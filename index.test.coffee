clone = require '@ppzp/utils/clone'
require('.')

equal = (a, b) -> JSON.stringify(a) == JSON.stringify(b)

test 'Array::last', ->
  expect [1,2,3].last()
  .toBe 3
  
  expect [1,2,3].last(2)
  .toBe 1
  
  expect [].last()
  .toBe undefined

test 'Array::sum', ->
  expect [1,2,3].sum()
  .toBe 6
  
  expect [
    { k: e: y: 1 }
    { k: e: y: 2 }
    { k: e: y: 3 }
  ].sum (item) -> item.k.e.y
  .toBe 6

  expect [].sum()
  .toBe 0

test 'Array::sum functional', ->
  raw = [
    { value: 1 }
    { value: 2 }
    { value: 3 }
  ]
  backup = clone raw
  expect raw.sum (item) -> item.value
  .toBe 6
  expect equal raw, backup
  .toBe true

test 'Array::product', ->
  expect [1,2,3].product()
  .toBe 6

  expect [
    { value: 1 }
    { value: 2 }
    { value: 3 }
  ].product (item) -> item.value
  .toBe 6

  expect [].product()
  .toBe undefined

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
