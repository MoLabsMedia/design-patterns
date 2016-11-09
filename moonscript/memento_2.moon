class Memento
  new: ( data ) =>
    @data = data
    return 

{ :Memento }
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
import States from require 'States'

sts = States( 'begin' )
print sts.state
m = sts\save( 'doing' )
print sts.state
sts\restore()
print sts.state
