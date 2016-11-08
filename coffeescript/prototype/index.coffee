class Prototype
  clone: ->
    if Object.create
      Object.create @
    else # if < IE9
      Clone = ->
      Clone:: = @
      new Clone()
  setProperty: ( @property ) ->
  logProperty: -> console.log @property or '-'

class ConcretePrototype1 extends Prototype
class ConcretePrototype2 extends Prototype

class Client
  constructor: ->
  operation: ( prototype ) -> p = prototype.clone()

class Example
  @run: ->
    client = new Client()
    cp1 = new ConcretePrototype1()
    cp1Prototype = client.operation cp1
    cp1.setProperty 'original1'
    cp1Prototype.setProperty 'clone1'
    cp1.logProperty()
    cp1Prototype.logProperty()
Example.run()
