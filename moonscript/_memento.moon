class Memento
  constructor: ( @prop ) ->
  getProp: -> 
    return @prop

class Originator
  constructor: ( @prop ) ->
  createMementoFromProperty: -> 
    return new Memento( @prop )
  changePropByMemento: ( memento ) ->
    @prop = memento.getProp()
    return
  changeProp: ( @prop ) ->
  showProp: -> 
    console.log @prop
    return

class Caretaker
  constructor: ( @originator ) ->
  doCommand: ->
    @memento = @originator.createMementoFromProperty()
    return
  undoCommand: -> 
    @originator.changePropByMemento( @memento )
    return

class Main
  @run: ->
    originator = new Originator( 'a' )
    caretaker = new Caretaker( originator )

    originator.showProp()
    caretaker.doCommand()

    originator.changeProp( 'b' )
    originator.showProp()

    caretaker.undoCommand()
    originator.showProp()
    return

Main.run()
