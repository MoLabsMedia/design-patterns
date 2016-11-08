import Target from require 'Target'
class Adapter extends Target
  new: ( @adaptee ) =>
  request: => @adaptee\specificRequest()

{ :Adapter }
