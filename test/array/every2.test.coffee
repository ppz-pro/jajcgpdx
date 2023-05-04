{ equal, clone } = require '..'

test 'Array::every22', ->
  raw = [1,2,3]
  expect raw.every22 (a, b) -> a <= b
  .toBe true
  expect raw.every2 (a, b) -> a <= b
  .toBe true
  
  expect raw
  .toEqual [1,2,3]

  expect [1,2,2,3].every22 (a, b) -> a < b
  .toBe 1
  expect [1,2,2,3].every2 (a, b) -> a < b
  .toBe false

  expect [
    { year: 1 }
    { year: 2 }
    { year: 1 }
    { year: 3 }
  ].every22 (a, b) -> a.year < b.year
  .toBe 1
  expect [
    { year: 1 }
    { year: 2 }
    { year: 1 }
    { year: 3 }
  ].every2 (a, b) -> a.year < b.year
  .toBe false

  expect [
    { year: 1 }
    { year: 2 }
    { year: 2 }
    { year: 3 }
  ].every22 (a, b) -> a.year < b.year
  .toBe 1
  expect [
    { year: 1 }
    { year: 2 }
    { year: 2 }
    { year: 3 }
  ].every2 (a, b) -> a.year < b.year
  .toBe false

  expect [
    { year: 1 }
    { year: 2 }
    { year: 2 }
    { year: 3 }
  ].every22 (a, b) -> a.year <= b.year
  .toBe true

  expect [
    { year: 1 }
    { year: 2 }
    { year: 2 }
    { year: 3 }
  ].every2 (a, b) -> a.year <= b.year
  .toBe true
  
  expect [].every22 (a, b) -> a < b
  .toBe undefined
  expect [1].every22 (a, b) -> a < b
  .toBe undefined
  expect [].every2 (a, b) -> a < b
  .toBe undefined
  expect [1].every2 (a, b) -> a < b
  .toBe undefined
