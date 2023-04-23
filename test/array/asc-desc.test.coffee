{ equal, clone } = require '..'

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
