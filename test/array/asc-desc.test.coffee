{ equal, clone } = require '..'

test 'Array::is_asc', ->
  raw = [1,2,2,3]
  
  expect raw.is_asc()
  .toBe true

  expect raw
  .toEqual [1,2,2,3]

  expect [1,2,1,3].is_asc()
  .toBe false
  
  expect [2, 1, 3].is_asc()
  .toBe false
  expect [1, 3, 2].is_asc()
  .toBe false

  expect [
    { year: 1 }
    { year: 2 }
    { year: 2 }
    { year: 3 }
  ].is_asc (item) -> item.year
  .toBe true

  expect [
    { year: 1 }
    { year: 2 }
    { year: 1 }
    { year: 3 }
  ].is_asc (item) -> item.year
  .toBe false

  expect [].is_asc()
  .toBe undefined
  expect [1].is_asc()
  .toBe undefined

test 'Array::is_desc', ->
  expect [3,2,1].is_desc()
  .toBe true
  expect [3,2,2,1].is_desc()
  .toBe true

  expect [].is_desc()
  .toBe undefined
  expect [1].is_desc()
  .toBe undefined
