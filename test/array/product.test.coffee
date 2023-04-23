{ equal, clone } = require '..'

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

test 'Array::product functional', ->
  raw = [
    { value: 1 }
    { value: 2 }
    { value: 3 }
  ]
  backup = clone raw
  expect raw.product (item) -> item.value
  .toBe 6
  expect equal raw, backup
  .toBe true
