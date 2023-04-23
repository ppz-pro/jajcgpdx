{ equal, clone } = require '..'

test 'Array::heavyUnique', ->
  expect [].heavyUnique()
  .toEqual []

  expect [1,2,3].heavyUnique()
  .toEqual [1,2,3]

  expect [1,2,3,1,2,3].heavyUnique()
  .toEqual [1,2,3]

  # heavy!
  expect [
    { value: 1 }
    { value: 2 }
    { value: 3 }
    { value: 1 }
    { value: 2 }
    { value: 3 }
  ].heavyUnique()
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
  ].heavyUnique (a, b) => a.value == b.value
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

    expect [first, second, duplicatedSecond, third].heavyUnique()
    .toEqual [first, second, duplicatedSecond, third]
    
    expect [first, second, duplicatedSecond, third].heavyUnique (a, b) -> a.getTime() == b.getTime()
    .toEqual [first, second, third]

test 'Array::heavyUnique functional', ->
  raw = [
    { value: 1 }
    { value: 2 }
    { value: 3 }
    { value: 1 }
    { value: 2 }
    { value: 3 }
  ]
  backup = clone raw
  expect raw.heavyUnique (a, b) -> a.value == b.value
  .toEqual [
    { value: 1 }
    { value: 2 }
    { value: 3 }
  ]
  expect equal raw, backup
  .toBe true
