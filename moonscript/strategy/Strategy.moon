class Strategy
  _algorithm = nil

  new: ( algorithm ) =>
    @useAlgorithm( algorithm )
    return
  useAlgorithm: ( algorithm ) =>
    _algorithm = algorithm
    return
  applyAlgorithm: ( target ) =>
    _algorithm( target )
    return

{ :Strategy }
