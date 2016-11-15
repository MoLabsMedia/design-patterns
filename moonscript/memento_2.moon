class Memento
  new: ( @prop ) =>
  getProp: () =>
    return @prop

class Config
  new: ( @prop ) =>
  getProp: () =>
    return @prop
  saveProp: ( prop_val ) =>
    @prop = prop_val
    memento = Memento( @prop )
    return memento
  restoreProp: ( memento ) =>
    @prop = memento\getProp()
    return

prop = "The original string"
pt = Config( prop )
pt\prop -- => "The original string"

memento = pt\saveProp "A string"
print pt\getProp() -- => "A string"

pt\saveProp( "Yet another string" )
print pt\getProp() -- => "Yet another string"

pt\restoreProp( memento )
print pt\getProp() -- => "The original string"
