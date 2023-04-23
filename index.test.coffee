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

test 'Array::heavyCount', ->
  expect [].heavyCount()
  .toBe 0

  expect [1,2,3].heavyCount()
  .toBe 3

  expect [1,2,3,1,2,3].heavyCount()
  .toBe 3

  # heavy!
  expect [
    { value: 1 }
    { value: 2 }
    { value: 3 }
    { value: 1 }
    { value: 2 }
    { value: 3 }
  ].heavyCount()
  .toBe 6

  expect [
    { value: 1 }
    { value: 2 }
    { value: 3 }
    { value: 1 }
    { value: 2 }
    { value: 3 }
  ].heavyCount (a, b) => a.value == b.value
  .toBe 3

  do ->
    first = new Date(1)
    second = new Date(2)
    duplicatedSecond = new Date(2)
    third = new Date(3)

    expect [first, second, duplicatedSecond, third].heavyCount()
    .toBe 4
    
    expect [first, second, duplicatedSecond, third].heavyCount (a, b) -> a.getTime() == b.getTime()
    .toBe 3

test 'Array::heavyCount functional', ->
  raw = [
    { value: 1 }
    { value: 2 }
    { value: 3 }
    { value: 1 }
    { value: 2 }
    { value: 3 }
  ]
  backup = clone raw
  expect raw.heavyCount (a, b) -> a.value == b.value
  .toBe 3
  expect equal raw, backup
  .toBe true

test 'Array::getObj', ->
  expect -> [].getObj()
  .toThrow()
  expect -> [1].getObj()
  .toThrow()

  getObj = (obj, item, index) ->
    obj[item.id] = { index, item }
  
  expect [].getObj getObj
  .toEqual {}

  expect [
    { id: 1, name: 'ppz' }
    { id: 2, name: 'ccs' }
    { id: 3, name: 'jj' }
    { id: 4, name: 'yyz' }
  ].getObj getObj 
  .toEqual {
    1: { index: 0, item: { id: 1, name: 'ppz' } }
    2: { index: 1, item: { id: 2, name: 'ccs' } }
    3: { index: 2, item: { id: 3, name: 'jj' } }
    4: { index: 3, item: { id: 4, name: 'yyz' } }
  }
  
  expect [
    { id: 1, name: 'ppz' }
    { id: 2, name: 'ccs' }
    { id: 3, name: 'jj' }
    { id: 3, name: 'jjz' }
    { id: 4, name: 'yyz' }
  ].getObj getObj
  .toEqual {
    1: { index: 0, item: { id: 1, name: 'ppz' } }
    2: { index: 1, item: { id: 2, name: 'ccs' } }
    3: { index: 3, item: { id: 3, name: 'jjz' } }
    4: { index: 4, item: { id: 4, name: 'yyz' } }
  }

test 'Array::getObj functional', ->
  raw = [
    { id: 1, name: 'ppz' }
    { id: 2, name: 'ccs' }
    { id: 3, name: 'jj' }
    { id: 4, name: 'yyz' }
  ]
  backup = clone raw
  expect raw.getObj (obj, item, index) ->
    obj[item.id] = { index, item }
  .toEqual {
    1: { index: 0, item: { id: 1, name: 'ppz' } }
    2: { index: 1, item: { id: 2, name: 'ccs' } }
    3: { index: 2, item: { id: 3, name: 'jj' } }
    4: { index: 3, item: { id: 4, name: 'yyz' } }
  }
  expect equal raw, backup
  .toBe true

test 'Array::getMap', ->
  expect -> [].getMap()
  .toThrow()
  expect -> [1].getMap()
  .toThrow()

  user1 = { id: 1, user: 'ppz' }
  user2 = { id: 2, user: 'ccs' }
  user3 = { id: 3, user: 'jj' }
  user4 = { id: 4, user: 'yyz' }
  city1 = { id: 1, city: 'shanghai' }
  city2 = { id: 2, city: 'beijing' }
  list = [
    { user: user1, city: city1 }
    { user: user2, city: city2 }
    { user: user3, city: city1 }
    { user: user4, city: city2 }
  ]
  backup = clone list
  setMap = (map, item) ->
    map.set item.user, item.city
  
  do ->
    temp = [].getMap setMap
    expect temp
    .toEqual new Map
    expect Array.from temp.entries()
    .toEqual []

  do ->
    temp = list.getMap setMap
    expect Array.from temp.entries()
    .toEqual [
      [user1, city1]
      [user2, city2]
      [user3, city1]
      [user4, city2]
    ]

    # functional
    expect equal list, backup
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
