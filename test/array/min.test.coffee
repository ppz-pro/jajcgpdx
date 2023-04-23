{ equal, clone } = require '..'

test 'Array::min2', ->
  expect [].min2()
  .toBe undefined

  expect [1,2,3].min2()
  .toEqual [1, 1, 0]

  expect [1,2,3,4,1,3,5,2,3].min2()
  .toEqual [1, 1, 0]

  expect [
    { value: 2 }
    { value: 1 }
    { value: 3 }
  ].min2 (item) -> item.value
  .toEqual [1, { value: 1 }, 1]

  # 返回遇到的第一个最小值
  expect [
    { value: 2 }
    { value: 1 }
    { value: 3 }
    { value: 1 }
  ].min2 (item) -> item.value
  .toEqual [1, { value: 1 }, 1]

test 'Array::min', ->
  expect [].min()
  .toBe undefined

  expect [1,2,3].min()
  .toBe 1

  expect [1,2,3,4,1,3,5,2,3].min()
  .toBe 1

  expect [
    { value: 2 }
    { value: 1 }
    { value: 3 }
  ].min (item) -> item.value
  .toEqual 1

test 'Array::min functional', ->
  raw = [
    { value: 2 }
    { value: 1 }
    { value: 3 }
  ]
  backup = clone raw
  expect raw.min (item) -> item.value
  .toEqual 1
  expect equal raw, backup
  .toBe true
