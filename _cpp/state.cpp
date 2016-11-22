class AbstractState
  processA: () ->
  processB: () ->
  processC: () ->
class ConcreteStateA
  constructor: ( @states_wrapper ) ->
  processA: () ->
  processB: () ->
  processC: () ->
class ConcreteStateB
  constructor: ( @states_wrapper ) ->
  processB: () ->
  processC: () ->
class ConcreteStateC
  constructor: ( @states_wrapper ) ->
  processC: () ->

class StatesWrapper
  _current = undefined
  _states = []
  constructor: () ->
    _states.push new ConcreteStateA( this )
    _states.push new ConcreteStateB( this )
    _states.push new ConcreteStateC( this )
    _current = _states[0]
    return
  setCurrent: ( state ) ->
    _current = state
    return
  process: () ->
    _current.processA()
    _current.processB()
    _current.processC()
    return

class Main
  @run: () ->
    wrapper = new StatesWrapper()

    wrapper.process()
    return

Main.run()
