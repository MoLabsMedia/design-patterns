class Memento
  constructor: ( @state ) ->
  getState: -> @state

class Originator
  constructor: ( @state ) ->
  setMemento: ( memento ) ->
    @state = memento.getState()
    return
  createMemento: -> new Memento( @state )
  _changeState: ( @state ) ->
  _showState: -> console.log @state

class Caretaker
  constructor: ( @originator ) ->
  doCommand: ->
    @state = @originator.createMemento()
    @originator.setMemento( @state )
  undoCommand: -> @originator.setMemento( @state )

class Client
  @run: ->
    originator = new Originator( 'foo' )
    caretaker = new Caretaker( originator )
    originator._showState()
    caretaker.doCommand()
    originator._changeState( 'bar' )
    originator._showState()
    caretaker.undoCommand()
    originator._showState()
Client.run()
