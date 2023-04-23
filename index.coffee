# attention: functional first

defaultGetValue = (target) -> target

Array::last = (index = 0) -> @[@length - 1 - index]

Array::sum = (getValue = defaultGetValue) ->
  result = 0
  @forEach (item, index) => result += getValue(item, index)
  return result

Array::product = (getValue = defaultGetValue) ->
  return unless @length
  result = 1
  # result = @shift() # this is wrong: it will change the original array
  @forEach (item, index) => result *= getValue(item, index)
  return result

Array::ave = (getValue = defaultGetValue) ->
  return unless @length
  return @sum(getValue) / @length

do ->
  maxAndMin = (compare) ->
    (getValue = defaultGetValue) ->
      return unless @length
      max = [getValue(@[0]), @[0], 0]
      for i in [1...@length]
        cur = getValue(@[i])
        if compare cur, max[0]
          max = [cur, @[i], i]
      return max
  
  Array::max2 = maxAndMin (a, b) -> a > b
  Array::max = (getValue) ->
    @max2(getValue)?[0]
  Array::min2 = maxAndMin (a, b) -> a < b
  Array::min = (getValue) ->
    @min2(getValue)?[0]

Array::unique = (getValue = defaultGetValue) ->
  set = new Set
  return @filter (item, index) ->
    value = getValue(item, index)
    if set.has value
      return false
    set.add(value)

Array::count = (getValue = defaultGetValue) ->
  @unique(getValue).length

Array::getObj = (callbackFn) ->
  result = {}
  @forEach (item, index) ->
    callbackFn result, item, index
  return result

Array::divide = (divider) ->
  return Object.entries(divider).getObj (result, [key, item]) ->
    result[key] ||= []
    result.push(item)

# like Array::every, but check 2 elements at the same time
Array::every22 = (callbackFn) ->
  return if @length < 2
  last = @shift()
  for i in [0..@length - 2]
    return i unless callbackFn last, @[i]
    last = @[i]
  return true
Array::every2 = (callbackFn) ->
  result = @every22 callbackFn
  return false if typeof(result) == 'number'
  return result

Array::isAsc = (getValue = defaultGetValue) ->
  @map getValue
  .every2 (a, b) -> a <= b
Array::isDesc = (getValue = defaultGetValue) ->
  @map getValue
  .every2 (a, b) -> a >= b

Array::any22 = (callbackFn) ->
  return if @length < 2
  last = @shift()
  for i in [0..@length - 2]
    return i if callbackFn @[i], last
    last = @[i]
  return false
Array::any2 = (callbackFn) ->
  result = @any22(callbackFn)
  return true if typeof(result) == 'number'
  return result

Number::loop = (callbackFn) ->
  for i in [0...this]
    callbackFn i

Number::floor = -> Math.floor this

Function::throttle = ->