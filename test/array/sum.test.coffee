{ equal, clone } = require '..'

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
