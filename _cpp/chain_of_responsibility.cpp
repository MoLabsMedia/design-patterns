class AbstractProcedure
  constructor: ( @key, @next_procedure ) ->
  process: -> 
    if @next_procedure 
      @next_procedure.process()
    return
class ConcreteProcedureA extends AbstractProcedure
  process: -> 
    super()
    # do something within ConcreteProcedureA
    return
class ConcreteProcedureB extends AbstractProcedure
  process: -> 
    super()
    # do something within ConcreteProcedureB
    return

class Main
  @run: ->
    procedure_a = new ConcreteProcedureA( 'rock' )
    procedure_b = new ConcreteProcedureB( 'paper', procedure_a )
    procedure_b.process()
    return

Main.run()
