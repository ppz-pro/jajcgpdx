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
    return true

# try not using it, get a way to use Array::unique
Array::heavyUnique = (equal = (a, b) -> a == b) ->
  temp = @unique() # remove the duplicated
  result = []
  for item in temp
    toBe = false
    for inner in result
      if equal item, inner
        toBe = true
        break
    result.push item if not toBe
  return result

Array::count = (getValue = defaultGetValue) ->
  @unique(getValue).length
Array::heavyCount = (equal = (a, b) -> a == b) ->
  @heavyUnique(equal).length

_arrayGetObj = (callbackFn, initResult) ->
  unless callbackFn instanceof Function
    throw new Error 'callbackFn must be a function'
  @forEach (item, index) ->
    callbackFn initResult, item, index
  return initResult

Array::getObj = (callbackFn) -> _arrayGetObj.call(@, callbackFn, {})
Array::getMap = (callbackFn) -> _arrayGetObj.call(@, callbackFn, new Map)

Array::divide = (divider) ->
  return @getObj (result, item, index) ->
    key = divider(item, index)
    result[key] ||= []
    result[key].push(item)

# like Array::every, but check 2 elements at the same time
Array::every22 = (callbackFn) ->
  return if @length < 2
  last = @[0] # 上一个比较的元素
  for i in [1..@length - 1]
    return i - 1 unless callbackFn last, @[i]
    last = @[i]
  return true
Array::every2 = (callbackFn) ->
  result = @every22 callbackFn
  return false if typeof(result) == 'number'
  return result

Array::isAsc = (getValue = defaultGetValue) ->
  # @every2 (a, b) -> getValue(a) < getValue(b) # 这种会对下标为 1~length-2 的元素进行两次 getValue
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

Array::promiseAll = ->

Array::sort2 = (compare) ->
  @slice().sort(compare)

# private
Number::isPositive = -> this > 0
Number::nonNegative = -> this >= 0
Number::isInteger = -> this % 1 == 0
Number::isPositiveInteger = -> this.isPositive() && this.isInteger()

Number::loop = (getItem) ->
  unless @nonNegative() && @isInteger()
    throw Error 'Number::loop must be called by non-negative integer'
  
  i = 0
  while i < this
    getItem i++

Number::getArray = (getItem = defaultGetValue) ->
  @loop getItem

Number::floor = -> Math.floor this
Number::ceil = -> Math.ceil this

Function::throttle = ->

pad_num = (num) ->
  num = num.toString()
  return num.padStart(2, '0')

Date::format = ->
  "#{@getFullYear()}-#{pad_num @getMonth() + 1}-#{pad_num @getDate()} #{pad_num @getHours()}:#{pad_num @getMinutes()}:#{pad_num @getSeconds()}"
