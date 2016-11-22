class AbstractPrototype
  clone: ->
    if Object.create
      return Object.create( @ )
    else # if < IE9
      Clone = () -> return
      Clone.prototype = @
      return new Clone()
  setProp: ( @prop ) ->
class ConcretePrototype extends AbstractPrototype

class Factory
  build: ( prototype ) -> return prototype.clone()

class Main
  @run: ->
    factory = new Factory()
    prototype_a = new ConcretePrototype()
    prototype_a_clone = factory.build( prototype_a )
    
    prototype_a.setProp( 'rock' )
    console.log prototype_a.prop

    prototype_a_clone.setProp( 'rock clone' )
    console.log prototype_a.prop
    return

Main.run()
