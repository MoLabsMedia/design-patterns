class Sandwich
  constructor: ( @customer, @bread = 'white', @toppings = [], @toasted = false )->

white = ( sw ) ->
  sw.bread = 'white'
  return sw
wheat = ( sw ) ->
  sw.bread = 'wheat'
  return sw
turkey = ( sw ) ->
  sw.toppings.push 'turkey'
  return sw
ham = ( sw ) ->
  sw.toppings.push 'ham'
  return sw
swiss = ( sw ) ->
  sw.toppings.push 'swiss'
  return sw
mayo = ( sw ) ->
  sw.toppings.push 'mayo'
  return sw
toasted = ( sw ) ->
  sw.toasted = true
  return sw

sandwich = ( customer ) ->
  return new Sandwich( customer )

to = ( customer ) ->
  return customer

send = ( sw ) ->
  toastedState = sw.toasted and 'a toasted' or 'an untoasted'

  toppingState = ''
  if sw.toppings.length > 0
    if sw.toppings.length > 1
      toppingState = " with #{ sw.toppings[ 0..sw.toppings.length - 2 ].join ', ' } and #{ sw.toppings[ sw.toppings.length - 1 ] }"
    else
      toppingState = " with #{ sw.toppings[0] }"
  console.log "#{ sw.customer } requested #{ toastedState }, #{ sw.bread } bread sandwich#{ toppingState }"
  return

send( sandwich( to( 'Charlie' ) ) ) # => "Charlie requested an untoasted, white bread sandwich"
send( turkey( sandwich( to( 'Judy' ) ) ) )   # => "Judy requested an untoasted, white bread sandwich with turkey"
send( toasted( ham( turkey( sandwich( to( 'Rachel' ) ) ) ) ) ) # => "Rachel requested a toasted, white bread sandwich with turkey and ham"
send( toasted( turkey( ham( swiss( sandwich( to( 'Matt' ) ) ) ) ) ) ) # => "Matt requested a toasted, white bread sandwich with swiss, ham and turkey"
