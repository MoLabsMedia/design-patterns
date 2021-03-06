# --------------
# CREDIT: http://coffeescript-cookbook.github.io/chapters/design_patterns/strategy
# --------------

class Sorter
  constructor: ( @algorithm ) ->
  changeAlgorithm: ( algorithm ) ->
    @algorithm = algorithm
    return
  sort: ( list ) -> 
    return @algorithm( list )

bubbleSort = ( list ) ->
  anySwaps = false
  swapPass = () ->
    for r in [ 0..list.length - 2 ]
      if list[r] > list[ r + 1 ]
        anySwaps = true
        [ list[r], list[ r + 1 ] ] = [ list[ r + 1 ], list[r] ]
    return

  swapPass()
  while anySwaps
    anySwaps = false
    swapPass()
  return list

reverseBubbleSort = ( list ) ->
  anySwaps = false
  swapPass = ->
    for r in [ list.length - 1..1 ]
      if list[r] < list[ r - 1 ]
        anySwaps = true
        [ list[r], list[ r - 1 ] ] = [ list[ r - 1 ], list[r] ]

  swapPass()
  while anySwaps
    anySwaps = false
    swapPass()
  return list

sorter = new Sorter( bubbleSort )
unsortedList = [ 'e', 'b', 'd', 'c', 'x', 'a' ]
console.log sorter.sort( unsortedList ) # => [ 'a', 'b', 'c', 'd', 'e', 'x' ]
unsortedList.push 'w'
sorter.changeAlgorithm( reverseBubbleSort )
console.log sorter.sort( unsortedList ) # => [ 'a', 'b', 'c', 'd', 'e', 'w', 'x' ]
