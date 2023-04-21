require 'jajcgpdx'
randomString = require 'jajcgpdx/random-string'

test 'random string', ->
  result = randomString 10
  expect result.length
  .toBe 10

  result = randomString 1000, 'abc'
  expect result.length
  .toBe 1000

  expect result.includes 'a'
  .toBe true
  expect result.includes 'b'
  .toBe true
  expect result.includes 'c'
  .toBe true

  expect /^(a|b|c)+$/.test result
  .toBe true
  expect /^(a|b|c)+$/.test 'abc'
  .toBe true
  expect /^(a|b|c)+$/.test 'cba'
  .toBe true
  expect /^(a|b|c)+$/.test 'aaa'
  .toBe true
  expect /^(a|b|c)+$/.test 'c'
  .toBe true

  expect /^(a|b|c)+$/.test 'abcd'
  .toBe false
  expect /^(a|b|c)+$/.test ''
  .toBe false
  expect /^(a|b|c)+$/.test 'd'
  .toBe false

test 'has a-z', ->
  result = randomString 10000
  set = new Set()
  for c in result
    expect(
      'abcdefghijklmnopqrstuvwxyz'.includes c
    ).toBe true
    set.add c
  expect set.size
  .toBe 26

console.log '@ppzp/meta 的名字是', randomString 8