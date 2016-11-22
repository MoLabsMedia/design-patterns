class AbstractPrototype
  clone: () =>
    if Object\create
      Object\create @
    else -- if < IE9
      Clone = =>
      Clone:: = @
      Clone()
  setProp: ( @prop ) =>
  logProp: () => 
    print @prop or '-'
    return

class ConcretePrototype extends AbstractPrototype

class Client
  new: () =>
  process: ( proto ) => 
    return proto\clone()

class Main
  @run: () =>
    client = Client()
    protoA = ConcretePrototype()
    protoAClone = client\process( protoA )
    
    protoA\setProp( 'a' )
    protoA\logProp()

    protoAClone\setProp( 'a clone' )
    protoAClone\logProp()
    return

Main.run()
