class List
  constructor: ->
    @items = [] # A list of pointers
    @objects = {} # Objects passed in by pointer
  count: -> @items.length # Returns the number of objects in the list
  get: ( index ) -> # Returns the object at the given length
    @objects[ @items[ index ] ]
  first: -> @objects[ @items[0] ] # Returns the first object in the list
  last: -> @objects[ @items[ @items.length - 1 ] ] # Returns the last object in the list
  append: ( item ) -> # Adds the argument to the list, making it the last item
    pointer = item.__POINTER__
    @items.push( pointer )
    @objects[ pointer ] = item
  remove: ( item ) -> # Removes the given element from the list.
    pointer = item.__POINTER__
    delete @objects[ pointer ] 
    index = pointer in @items
    @items.splice( index, 1 ) # delete @items[index] if index isnt -1
  removeLast: -> @remove @last # Removes the last element from the list
  removeFirst: -> @remove @first # Removes the first element from the list
  removeAll: -> @items = []; @objects = {} # Removes all elements from the list
list = new List()
list.append __POINTER__: 'uniqueid', other: 'properties'
