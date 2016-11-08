class Component
  constructor: -> @list = []
  getComposite: ->
  operation: ->
  add: ( component ) ->

class Leaf extends Component
class Composite extends Component
  add: ( component ) -> @list.push component
  operation: -> console.log @list
  getComposite: -> @

class Client
  @run: ->
    # Create a Composite object and add a Leaf
    composite = new Composite()
    leaf = new Leaf()
    composite.add( leaf )
    composite.operation()
    # Add a Composite to the Composite
    composite2 = new Composite()
    composite.add( composite2 )
    composite.operation()
Client.run()
