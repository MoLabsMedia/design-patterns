class AbstractProcedures
  process: () ->
    @procedureA()
    @procedureB()
    return
  procedureA: ->
  procedureB: ->
class ConcreteProceduresA extends AbstractProcedures
  procedureA: -> 
class ConcreteProceduresB extends AbstractProcedures
  procedureB: -> 

class StaticAbstractProcedures
  @process: ->
    cls = new @()
    cls.procedureA()
    cls.procedureB()
    return
  procedureA: ->
  procedureB: ->
class StaticConcreteProceduresA extends StaticAbstractProcedures
  procedureA: -> 
class StaticConcreteProceduresB extends StaticAbstractProcedures
  procedureB: -> 

class Main
  @run: ->
    clsA = new ConcreteProcedures()
    clsA.process()
    
    StaticConcreteProcedures.process()
    return

Main.run()
