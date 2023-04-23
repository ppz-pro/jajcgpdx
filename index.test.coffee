clone = require '@ppzp/utils/clone'
require('.')

equal = (a, b) -> JSON.stringify(a) == JSON.stringify(b)

test 'equal', ->
  expect equal [1,2,3], [1,2,3]
  .toBe true
  expect equal [1,2,3], [1,2,4]
  .toBe false
  expect equal 1, 2
  .toBe false
  expect equal [{ value: 1 }], [{ value: 2 }]
  .toBe false
  expect equal [{ value: 1 }], [{ value: 1 }]
  .toBe true

test 'Array::last', ->
  expect [1,2,3].last()
  .toBe 3
  
  expect [1,2,3].last(2)
  .toBe 1
  
  expect [].last()
  .toBe undefined

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

test 'Array::isAsc', ->
  expect [1,2,2,3].isAsc()
  .toBe true
  
  expect [].isAsc()
  .toBe undefined
  
  expect [1,2,1,3].isAsc()
  .toBe false

test 'Array::isDesc', ->
  expect [3,2,1].isDesc()
  .toBe true

test 'Number::loop', ->
  result = ''
  (10).loop (index) ->
    result += index
  expect(result).toBe '0123456789'
  
  expect(
    (10).loop (index) -> index
    .join('')
  ).toBe '0123456789'

test 'Number::floor', ->
  expect (6.88).floor()
  .toBe 6
