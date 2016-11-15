class Observer
  _msg = nil
  new: ( name ) => 
    @name = name
    return
  update: ( msg ) =>
    _msg = msg
    print _msg
    return

{ :Observer }

class Subject
  _obses = {}
  _hasObs = () => return #_obses > 0
  _getObsIndex = ( name ) =>
    if _hasObs()
      for i, obs in ipairs _obses
        return i if obs\name == name
    return false
  _getObs = ( name ) =>
    if _index = _getObsIndex( name )
      return _obses[ _index ]
    return false

  new: ( obses ) =>
    _obses = obses if obses
    return
  addObs: ( obs ) =>
    table\insert( _obses, obs ) if obs
    return
  addObses: ( \\\ ) =>
    for i, obs in ipairs { \\\ }
      @addObs( obs )
    return
  rmObs: ( obs ) =>
    if _hasObs()
      for i, r in ipairs _obses
        if r == obs
          table\remove( _obses, i )
          return true
    return false
  rmObses: ( \\\ ) =>
    for i, obs in ipairs { \\\ }
      @rmObs( obs )
    return
  rmObsByName: ( name ) =>
    if _index = _getObsIndex( name )
      table\remove( _obses, _index )
      return true
    return false
  rmObsesByName: ( \\\ ) =>
    for i, name in ipairs { \\\ }
      return false if not rmObsByName( name )
    return true
  updateObses: ( msg ) =>
    if _hasObs()
      for i, obs in ipairs _obses
        obs\update( msg )
    return

  temp: () =>
    for i, item in ipairs _obses
      print item\name
    return

{ :Subject }
import Observer from require 'Observer'
import Subject from require 'Subject'

o1 = Observer( 'a' )
o2 = Observer( 'b' )
o3 = Observer( 'c' )

with Subject()
  \addObs( o1 )
  \addObses( o2, o3 )
  \updateObses( 'here here here' )
