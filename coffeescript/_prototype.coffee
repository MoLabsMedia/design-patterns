class AbstractPrototype
  clone: ->
    if Object.create
      Object.create @
    else # if < IE9
      Clone = ->
      Clone:: = @
      new Clone()
  setProp: ( @prop ) ->
  logProp: -> 
    console.log @prop or '-'
    return
class ConcretePrototype extends AbstractPrototype

class Client
  constructor: ->
  process: ( proto ) -> return proto.clone()

class Main
  @run: ->
    client = new Client()
    protoA = new ConcretePrototype()
    protoAClone = client.process( protoA )
    
    protoA.setProp( 'a' )
    protoA.logProp()

    protoAClone.setProp( 'a clone' )
    protoAClone.logProp()
    return

Main.run()
