# --------------
# CREDIT: http://coffeescript-cookbook.github.io/chapters/design_patterns/memento
# --------------

class Memento
  constructor: ( @prop ) ->
  getProp: () -> return @prop

class Config
  constructor: ( @prop ) ->
  getProp: () -> return @prop
  saveProp: ( prop_val ) ->
    @prop = prop_val
    memento = new Memento( @prop )
    return memento
  restoreProp: ( memento ) ->
    @prop = memento.getProp()
    return

prop = "The original string"
pt = new Config( prop )
pt.prop # => "The original string"

memento = pt.saveProp "A new string"
console.log pt.getProp() # => "A new string"

pt.saveProp( "Yet another string" )
console.log pt.getProp() # => "Yet another string"

pt.restoreProp( memento )
console.log pt.getProp() # => "The original string"
