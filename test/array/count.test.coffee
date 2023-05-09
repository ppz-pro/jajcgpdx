{ equal, clone } = require '..'

test 'Array::count', ->
  expect [].count()
  .toBe 0

  expect [1,2,3].count()
  .toBe 3

  expect [1,2,3,1,2,3].count()
  .toBe 3

  expect [
    { value: 1 }
    { value: 2 }
    { value: 3 }
    { value: 1 }
    { value: 2 }
    { value: 3 }
  ].count (item) -> item.value
  .toBe 3

  do ->
    first = new Date(1)
    second = new Date(2)
    duplicatedSecond = new Date(2)
    third = new Date(3)

    expect [first, second, duplicatedSecond, third].count()
    .toBe 4
    
    expect [first, second, duplicatedSecond, third].count (item) -> item.getTime()
    .toBe 3

test 'Array::count functional', ->
  raw = [
    { value: 1 }
    { value: 2 }
    { value: 3 }
    { value: 1 }
    { value: 2 }
    { value: 3 }
  ]
  backup = clone raw
  expect raw.count (item) -> item.value
  .toBe 3
  expect equal raw, backup
  .toBe true

test 'Array::heavy_count', ->
  expect [].heavy_count()
  .toBe 0

  expect [1,2,3].heavy_count()
  .toBe 3

  expect [1,2,3,1,2,3].heavy_count()
  .toBe 3

  # heavy!
  expect [
    { value: 1 }
    { value: 2 }
    { value: 3 }
    { value: 1 }
    { value: 2 }
    { value: 3 }
  ].heavy_count()
  .toBe 6

  expect [
    { value: 1 }
    { value: 2 }
    { value: 3 }
    { value: 1 }
    { value: 2 }
    { value: 3 }
  ].heavy_count (a, b) => a.value == b.value
  .toBe 3

  do ->
    first = new Date(1)
    second = new Date(2)
    duplicatedSecond = new Date(2)
    third = new Date(3)

    expect [first, second, duplicatedSecond, third].heavy_count()
    .toBe 4
    
    expect [first, second, duplicatedSecond, third].heavy_count (a, b) -> a.getTime() == b.getTime()
    .toBe 3

test 'Array::heavy_count functional', ->
  raw = [
    { value: 1 }
    { value: 2 }
    { value: 3 }
    { value: 1 }
    { value: 2 }
    { value: 3 }
  ]
  backup = clone raw
  expect raw.heavy_count (a, b) -> a.value == b.value
  .toBe 3
  expect equal raw, backup
  .toBe true
