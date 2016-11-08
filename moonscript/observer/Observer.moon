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

