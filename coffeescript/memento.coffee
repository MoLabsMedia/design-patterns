class Memento
  _prop = undefined
  constructor: ( prop ) ->
    _prop = prop
    return
  getProp: -> 
    return _prop

class Originator
  _prop = undefined
  constructor: ( prop ) ->
    _prop = prop
    return
  createMementoFromProperty: -> 
    return new Memento( _prop )
  changePropByMemento: ( memento ) ->
    _prop = memento.getProp()
    return
  changeProp: ( prop ) ->
    _prop = prop
    return
  getProp: -> 
    return _prop

class Caretaker
  _memento = undefined
  constructor: ( @originator ) ->
  saveMemento: ->
    _memento = @originator.createMementoFromProperty()
    return
  undo: -> 
    @originator.changePropByMemento( _memento )
    return

class Main
  @run: ->
    originator = new Originator( 'rock' )
    caretaker = new Caretaker( originator )
    console.log originator.getProp()

    caretaker.saveMemento()

    originator.changeProp( 'paper' )
    console.log originator.getProp()

    caretaker.undo()
    console.log originator.getProp()
    return

Main.run()
