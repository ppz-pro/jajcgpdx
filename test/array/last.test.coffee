{ equal, clone } = require '..'

test 'Array::last', ->
  expect [1,2,3].last()
  .toBe 3
  
  expect [1,2,3].last(2)
  .toBe 1
  
  expect [].last()
  .toBe undefined
