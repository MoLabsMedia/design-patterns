class Context
  constructor: ( @strategy ) =>
  contextInterface: () => @strategy\algorithmInterface()

{ :Context }
