require('..')

exports.clone = require '@ppzp/utils/clone'
exports.equal = (a, b) -> JSON.stringify(a) == JSON.stringify(b)

# test 'equal', ->
#   expect equal [1,2,3], [1,2,3]
#   .toBe true
#   expect equal [1,2,3], [1,2,4]
#   .toBe false
#   expect equal 1, 2
#   .toBe false
#   expect equal [{ value: 1 }], [{ value: 2 }]
#   .toBe false
#   expect equal [{ value: 1 }], [{ value: 1 }]
#   .toBe true