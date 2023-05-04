{ equal, clone } = require '..'

test 'Array::sort2 functional', ->
  raw = [1, 3, 2]
  expect raw.sort2()
  .toEqual [1, 2, 3]

  expect raw
  .toEqual [1, 3, 2]

  # Array::sort 修改了原数组
  expect raw.sort()
  .toEqual [1, 2, 3]

  expect raw # 修改了原数组
  .toEqual [1, 2, 3]
