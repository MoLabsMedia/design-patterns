class Handler
  new: ( @kind, @successor ) =>
  handleRequest: => if @successor then @successor\handleRequest()

{ :Handler }
