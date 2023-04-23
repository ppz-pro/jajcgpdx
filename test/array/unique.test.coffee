{ equal, clone } = require '..'

test 'Array::unique', ->
  expect [].unique()
  .toEqual []

  expect [1,2,3].unique()
  .toEqual [1,2,3]

  expect [1,2,3,1,2,3].unique()
  .toEqual [1,2,3]

  expect [
    { value: 1 }
    { value: 2 }
    { value: 3 }
    { value: 1 }
    { value: 2 }
    { value: 3 }
  ].unique (item) -> item.value
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

    expect [first, second, duplicatedSecond, third].unique()
    .toEqual [first, second, duplicatedSecond, third]
    
    expect [first, second, duplicatedSecond, third].unique (item) -> item.getTime()
    .toEqual [first, second, third]

test 'Array::unique functional', ->
  raw = [
    { value: 1 }
    { value: 2 }
    { value: 3 }
    { value: 1 }
    { value: 2 }
    { value: 3 }
  ]
  backup = clone raw
  expect raw.unique (item) -> item.value
  .toEqual [
    { value: 1 }
    { value: 2 }
    { value: 3 }
  ]
  expect equal raw, backup
  .toBe true
