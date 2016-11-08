class List
  new: () =>
    @items = {} -- A list of pointers
    @objects = {} -- Objects passed in by pointer
  count: () => #@items -- Returns the number of objects in the list
  get: ( index ) => -- Returns the object at the given length
    @objects[ @items[ index ] ]
  first: () => @objects[ @items[ 1 ] ] -- Returns the first object in the list
  last: () => @objects[ @items[ @items.length ] ] -- Returns the last object in the list
  append: ( item ) => -- Adds the argument to the list, making it the last item
    pointer = item[ '__POINTER__' ]
    table.insert( @items, pointer )
    @objects[ pointer ] = item
  remove: ( item ) => -- Removes the given element from the list.
    pointer = item[ '__POINTER__' ]
    @objects[ pointer ] = nil
    -- index = pointer in @items
    for i, item in ipairs( @items )
      index = pointer if pointer == item
    @items.splice( index, 1 ) -- delete @items[index] if index isnt -1
  removeLast: () => @remove @last -- Removes the last element from the list
  removeFirst: () => @remove @first -- Removes the first element from the list
  removeAll: () => 
    @items = {}
    @objects = {} -- Removes all elements from the list
    return

list = List()
list.append __POINTER__: 'uniqueid', other: 'properties'

{ :List }
