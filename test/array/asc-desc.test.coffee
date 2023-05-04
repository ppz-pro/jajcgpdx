{ equal, clone } = require '..'

test 'Array::isAsc', ->
  raw = [1,2,2,3]
  
  expect raw.isAsc()
  .toBe true

  expect raw
  .toEqual [1,2,2,3]

  expect [1,2,1,3].isAsc()
  .toBe false
  
  expect [2, 1, 3].isAsc()
  .toBe false
  expect [1, 3, 2].isAsc()
  .toBe false

  expect [
    { year: 1 }
    { year: 2 }
    { year: 2 }
    { year: 3 }
  ].isAsc (item) -> item.year
  .toBe true

  expect [
    { year: 1 }
    { year: 2 }
    { year: 1 }
    { year: 3 }
  ].isAsc (item) -> item.year
  .toBe false

  expect [].isAsc()
  .toBe undefined
  expect [1].isAsc()
  .toBe undefined

test 'Array::isDesc', ->
  expect [3,2,1].isDesc()
  .toBe true
  expect [3,2,2,1].isDesc()
  .toBe true

  expect [].isDesc()
  .toBe undefined
  expect [1].isDesc()
  .toBe undefined
