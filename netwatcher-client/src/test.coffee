class A
  constructor: ->
     "something"
  b: -> 'n'

B = ->
  return "something else"

console.log new B
console.log new A

