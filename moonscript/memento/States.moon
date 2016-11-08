import Memento from require 'Memento'

class States
  _mems = {}
  _addMem = ( s ) ->
    m = Memento( s )
    table.insert( _mems, m )
    print #_mems
    return m
  _rmMem = () ->
    table.remove( _mems, #_mems )
    return _mems[ #_mems ]

  new: ( state ) =>
    if state
      @state = state
      _addMem( state )
    return
  save: ( newState ) =>
    @state = newState
    return _addMem( newState )
  restore: ( mem ) =>
    if mem and mem.__class == Memento
      @state = mem.data
    elseif #_mems >= 2
      @state = _mems[ #_mems - 1 ].data
    return

{ :States }
