{ equal, clone } = require '..'

test 'Array::max2', ->
  expect [].max2()
  .toBe undefined

  expect [1,2,3].max2()
  .toEqual [3, 3, 2]

  expect [1,2,3,4,1,3,5,2,3].max2()
  .toEqual [5, 5, 6]

  expect [
    { value: 1 }
    { value: 2 }
    { value: 3 }
  ].max2 (item) -> item.value
  .toEqual [3, { value: 3 }, 2]

  # 返回遇到的第一个最大值
  expect [
    { value: 1 }
    { value: 2 }
    { value: 3 }
    { value: 3 }
  ].max2 (item) -> item.value
  .toEqual [3, { value: 3 }, 2]

test 'Array::max', ->
  expect [].max()
  .toBe undefined

  expect [1,2,3].max()
  .toBe 3

  expect [1,2,3,4,1,3,5,2,3].max()
  .toBe 5

  expect [
    { value: 1 }
    { value: 2 }
    { value: 3 }
  ].max (item) -> item.value
  .toBe 3

test 'Array::max functional', ->
  raw = [
    { value: 1 }
    { value: 2 }
    { value: 3 }
  ]
  backup = clone raw
  expect raw.max (item) -> item.value
  .toBe 3
  expect equal raw, backup
  .toBe true
