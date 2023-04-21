module.exports = (length = 8, seed = 'abcdefghijklmnopqrstuvwxyz') ->
  length.loop ->
    seed[
      (Math.random() * seed.length).floor()
    ]
  .join('')
