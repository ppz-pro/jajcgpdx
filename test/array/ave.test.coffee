{ equal, clone } = require '..'

test 'Array::ave', ->
  expect [1,2,3].ave()
  .toBe 2

  expect [
    { value: 1 }
    { value: 2 }
    { value: 3 }
  ].ave (item) -> item.value
  .toBe 2

  expect [].ave()
  .toBe undefined

test 'Array::ave functional', ->
  raw = [
    { value: 1 }
    { value: 2 }
    { value: 3 }
  ]
  backup = clone raw
  expect raw.ave (item) -> item.value
  .toBe 2
  expect equal raw, backup
  .toBe true
