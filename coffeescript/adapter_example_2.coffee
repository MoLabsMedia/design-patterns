# --------------
# CREDIT: http://coffeescript-cookbook.github.io/chapters/design_patterns/adapter
# --------------

class Grid
  constructor: ( @data ) ->
    @order = 'ASC' 
    @sorter = new NullSorter # use NullObject pattern
    return
  applySorter: ( @sorter ) ->
  sort: () ->
    @data = @sorter.sort( @data, @order )
    return

class NullSorter
  sort: ( data, order ) -> 
  
class RandomSorter
  sort: ( data )->
    # shuffle data:
    for i in [ data.length - 1..1 ]
      j = Math.floor( Math.random()*( i + 1 ) )
      [ data[i], data[j] ] = [ data[j], data[i] ]
    return data

class SorterAdapter
  constructor: ( @sorter ) ->
  sort: ( data, order ) ->
    return @sorter.sort( data )

data = [ 'a','b','c','d','e','f' ]
g = new Grid( data )
g.applySorter( new SorterAdapter( new RandomSorter ) ) # apply sorter through adapter
g.sort()
console.log g.data
