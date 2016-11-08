class Prototype
  clone: () =>
    if Object.create
      Object.create @
    else -- if < IE9
      Clone = =>
      Clone:: = @
      Clone()
  setProperty: ( @property ) =>
  logProperty: () => print @property or '-'

{ :Prototype }
