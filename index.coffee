defaultGetValue = (target) -> target

Array::sum = (getValue = defaultGetValue) ->
  result = 0
  @forEach (item, index) => result += getValue(item, index)
  return result

Array::product = (getValue = defaultGetValue) ->
  return unless @length
  result = 1
  @forEach (item, index) => result *= getValue(item, index)
  return result

Array::ave = (getValue = defaultGetValue) ->
  return unless @length
  return @sum(getValue) / @length

do ->
  maxAndMin = (compare) ->
    (getValue = defaultGetValue) ->
      return unless @length
      first = @shift()
      max = [getValue(first), first, 0]
      for item, i in this
        cur = getValue(item)
        if compare cur, max[0]
          max = [cur, item, i]
      return max
  
  Array::max2 = maxAndMin (a, b) -> a > b
  Array::max = -> @max2()[0]
  Array::min2 = maxAndMin (a, b) -> a < b
  Array::min = -> @min2()[0]

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

Number::loop = (callbackFn) ->
  for i in [0...this]
    callbackFn i

Number::floor = -> Math.floor this

Function::throttle = ->