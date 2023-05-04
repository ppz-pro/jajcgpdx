{ equal, clone } = require '..'

getArr = -> [
  { user: 'ccz', city: 'beijing', detail: 'fake detail' }
  { user: 'ppz', city: 'shanghai', detail: '孙环路 377 弄' }
  { user: 'ppz', city: 'shanghai', detail: '锦绣路 3088 弄' }
  { user: 'ccz', city: 'shanghai', detail: '锦绣路 3088 弄' }
  { user: 'ppz', city: 'beijing', detail: 'fake detail' }
  { user: 'ccz', city: 'shanghai', detail: '孙环路 377 弄'}
]

test 'Array::divide basic', ->
  expect getArr().divide (item) -> item.user
  .toEqual {
    ppz: [
      { user: 'ppz', city: 'shanghai', detail: '孙环路 377 弄' }
      { user: 'ppz', city: 'shanghai', detail: '锦绣路 3088 弄' }
      { user: 'ppz', city: 'beijing', detail: 'fake detail' }
    ]
    ccz: [
      { user: 'ccz', city: 'beijing', detail: 'fake detail' }
      { user: 'ccz', city: 'shanghai', detail: '锦绣路 3088 弄' }
      { user: 'ccz', city: 'shanghai', detail: '孙环路 377 弄'}
    ]
  }

test 'Array::divide empty array', ->
  expect [].divide()
  .toEqual {}
