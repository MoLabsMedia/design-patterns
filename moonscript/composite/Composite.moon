import Component from require 'Component'
class Composite extends Component
  add: ( component ) => table.insert( @list, component )
  operation: () => print @list
  getComposite: () => @

{ :Composite }
