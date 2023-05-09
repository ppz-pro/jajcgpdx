{ equal, clone } = require '..'

test 'Array::heavy_unique', ->
  expect [].heavy_unique()
  .toEqual []

  expect [1,2,3].heavy_unique()
  .toEqual [1,2,3]

  expect [1,2,3,1,2,3].heavy_unique()
  .toEqual [1,2,3]

  # heavy!
  expect [
    { value: 1 }
    { value: 2 }
    { value: 3 }
    { value: 1 }
    { value: 2 }
    { value: 3 }
  ].heavy_unique()
  .toEqual [
    { value: 1 }
    { value: 2 }
    { value: 3 }
    { value: 1 }
    { value: 2 }
    { value: 3 }
  ]

  expect [
    { value: 1 }
    { value: 2 }
    { value: 3 }
    { value: 1 }
    { value: 2 }
    { value: 3 }
  ].heavy_unique (a, b) => a.value == b.value
  .toEqual [
    { value: 1 }
    { value: 2 }
    { value: 3 }
  ]

  do ->
    first = new Date(1)
    second = new Date(2)
    duplicatedSecond = new Date(2)
    third = new Date(3)

    expect [first, second, duplicatedSecond, third].heavy_unique()
    .toEqual [first, second, duplicatedSecond, third]
    
    expect [first, second, duplicatedSecond, third].heavy_unique (a, b) -> a.getTime() == b.getTime()
    .toEqual [first, second, third]

test 'Array::heavy_unique functional', ->
  raw = [
    { value: 1 }
    { value: 2 }
    { value: 3 }
    { value: 1 }
    { value: 2 }
    { value: 3 }
  ]
  backup = clone raw
  expect raw.heavy_unique (a, b) -> a.value == b.value
  .toEqual [
    { value: 1 }
    { value: 2 }
    { value: 3 }
  ]
  expect equal raw, backup
  .toBe true
