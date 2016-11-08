import Component from require 'Component'
class Decorator extends Component
  new: ( @component ) =>
  process: () => @component\process()

{ :Decorator }
