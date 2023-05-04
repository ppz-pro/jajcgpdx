{ equal, clone } = require '..'

getArr = -> [
  { year: 1, name: 'abc' }
  { year: 3, name: 'def' }
  { year: 99, name: 'opq' }
  { year: 28, name: 'xyz' }
  { year: 18, name: 'uvw' }
  { year: 18, name: 'hij' }
  { year: 58, name: 'klm' }
  { year: 2, name: 'g' }
  { year: 18, name: 'n' }
  { year: 28, name: 'rst' }
]

test 'Array::divide basic', ->
  raw = getArr()
  
  expect raw.divide (item) ->
    if item.year < 10
      return 'child'
    else if item.year < 20
      return 'teenager'
    else if item.year < 60
      return 'adult'
    else
      return 'old'
  .toEqual {
    child: [
      { year: 1, name: 'abc' }
      { year: 3, name: 'def' }
      { year: 2, name: 'g' }
    ]
    teenager: [
      { year: 18, name: 'uvw' }
      { year: 18, name: 'hij' }
      { year: 18, name: 'n' }
    ]
    adult: [
      { year: 28, name: 'xyz' }
      { year: 58, name: 'klm' }
      { year: 28, name: 'rst' }
    ]
    old: [
      { year: 99, name: 'opq' }
    ]
  }

  expect raw
  .toEqual getArr()

test 'Array::divide empty array', ->
  expect [].divide()
  .toEqual {}
