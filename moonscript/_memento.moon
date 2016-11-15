class Memento
  new: ( @prop ) =>
  getProp: () => 
    return @prop

class Originator
  new: ( @prop ) =>
  createMementoFromProperty: () => 
    return Memento( @prop )
  changePropByMemento: ( memento ) =>
    @prop = memento\getProp()
    return
  changeProp: ( @prop ) =>
  showProp: () => 
    print @prop
    return

class Caretaker
  new: ( @originator ) =>
  doCommand: () =>
    @memento = @originator\createMementoFromProperty()
    return
  undoCommand: () => 
    @originator\changePropByMemento( @memento )
    return

class Main
  @run: () =>
    originator = Originator( 'a' )
    caretaker = Caretaker( originator )

    originator\showProp()
    caretaker\doCommand()

    originator\changeProp( 'b' )
    originator\showProp()

    caretaker\undoCommand()
    originator\showProp()
    return

Main.run()
