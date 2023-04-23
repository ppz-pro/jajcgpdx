{ equal, clone } = require '..'

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
