class Publisher
  _subs = {}
  _hasSub = () -> return #_subs > 0
  _getSubIndex = ( name ) ->
    if _hasSub()
      for i, sub in ipairs _subs
        return i if sub.name == name
    return false
  _getSub = ( name ) ->
    if _index = _getSubIndex( name )
      return _subs[ _index ]
    return false

  new: ( subs ) =>
    _subs = subs if subs
    return
  addSub: ( sub ) =>
    table.insert( _subs, sub ) if sub
    return
  addSubs: ( ... ) =>
    for i, sub in ipairs { ... }
      @addSub( sub )
    return
  rmSub: ( sub ) =>
    if _hasSub()
      for i, s in ipairs _subs
        if s == sub
          table.remove( _subs, i )
          return true
    return false
  rmSubs: ( ... ) =>
    for i, sub in ipairs { ... }
      @rmSub( sub )
    return
  rmSubByName: ( name ) =>
    if _index = _getSubIndex( name )
      table.remove( _subs, _index )
      return true
    return false
  rmSubsByName: ( ... ) =>
    for i, name in ipairs { ... }
      return false if not rmSubByName( name )
    return true
  updateSubs: ( msg, info ) =>
    if _hasSub()
      for i, sub in ipairs _subs
        sub\update( msg, info )
    return

  temp: () =>
    for i, s in ipairs _subs
      print s.name
    return

{ :Publisher }

