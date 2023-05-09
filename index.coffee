# attention: functional first

default_get_value = (target) -> target

Array::last = (index = 0) -> @[@length - 1 - index]

Array::sum = (get_value = default_get_value) ->
  result = 0
  @forEach (item, index) => result += get_value(item, index)
  return result

Array::product = (get_value = default_get_value) ->
  return unless @length
  result = 1
  # result = @shift() # this is wrong: it will change the original array
  @forEach (item, index) => result *= get_value(item, index)
  return result

Array::ave = (get_value = default_get_value) ->
  return unless @length
  return @sum(get_value) / @length

max_and_min = (compare) ->
  (get_value = default_get_value) ->
    return unless @length
    max = [get_value(@[0]), @[0], 0]
    for i in [1...@length]
      cur = get_value(@[i])
      if compare cur, max[0]
        max = [cur, @[i], i]
    return max
Array::max2 = max_and_min (a, b) -> a > b
Array::max = (get_value) ->
  @max2(get_value)?[0]
Array::min2 = max_and_min (a, b) -> a < b
Array::min = (get_value) ->
  @min2(get_value)?[0]

Array::unique = (get_value = default_get_value) ->
  set = new Set
  return @filter (item, index) ->
    value = get_value(item, index)
    if set.has value
      return false
    set.add(value)
    return true

# try not using it, get a way to use Array::unique
Array::heavy_unique = (equal = (a, b) -> a == b) ->
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

Array::count = (get_value = default_get_value) ->
  @unique(get_value).length
Array::heavy_count = (equal = (a, b) -> a == b) ->
  @heavy_unique(equal).length

_array_get_obj = (callback_fn, init_result) ->
  unless callback_fn instanceof Function
    throw new Error 'callback_fn must be a function'
  @forEach (item, index) ->
    callback_fn init_result, item, index
  return init_result

Array::get_obj = (callback_fn) -> _array_get_obj.call(@, callback_fn, {})
Array::getMap = (callback_fn) -> _array_get_obj.call(@, callback_fn, new Map)

Array::divide = (divider) ->
  return @get_obj (result, item, index) ->
    key = divider(item, index)
    result[key] ||= []
    result[key].push(item)

# like Array::every, but check 2 elements at the same time
Array::every22 = (callback_fn) ->
  return if @length < 2
  last = @[0] # 上一个比较的元素
  for i in [1..@length - 1]
    return i - 1 unless callback_fn last, @[i]
    last = @[i]
  return true
Array::every2 = (callback_fn) ->
  result = @every22 callback_fn
  return false if typeof(result) == 'number'
  return result

Array::is_asc = (get_value = default_get_value) ->
  # @every2 (a, b) -> get_value(a) < get_value(b) # 这种会对下标为 1~length-2 的元素进行两次 get_value
  @map get_value
  .every2 (a, b) -> a <= b
Array::is_desc = (get_value = default_get_value) ->
  @map get_value
  .every2 (a, b) -> a >= b

Array::any22 = (callback_fn) ->
  return if @length < 2
  last = @shift()
  for i in [0..@length - 2]
    return i if callback_fn @[i], last
    last = @[i]
  return false
Array::any2 = (callback_fn) ->
  result = @any22(callback_fn)
  return true if typeof(result) == 'number'
  return result

# TODO
# Array::promise_all = ->

Array::sort2 = (compare) ->
  @slice().sort(compare)

# private
Number::is_positive = -> this > 0
Number::non_negative = -> this >= 0
Number::is_integer = -> this % 1 == 0
Number::is_positiveInteger = -> this.is_positive() && this.is_integer()

Number::loop = (get_item) ->
  unless @non_negative() && @is_integer()
    throw Error 'Number::loop must be called by non-negative integer'
  
  i = 0
  while i < this
    get_item i++

Number::get_array = (get_item = default_get_value) ->
  @loop get_item

Number::floor = -> Math.floor this
Number::ceil = -> Math.ceil this

# TODO
# Function::throttle = ->

pad_num = (num) ->
  num = num.toString()
  return num.padStart(2, '0')

Date::format = ->
  "#{@getFullYear()}-#{pad_num @getMonth() + 1}-#{pad_num @getDate()} #{pad_num @getHours()}:#{pad_num @getMinutes()}:#{pad_num @getSeconds()}"
