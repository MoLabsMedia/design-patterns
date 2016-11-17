# --------------
# CREDIT: http://coffeescript-cookbook.github.io/chapters/design_patterns/singleton
# --------------

class Singleton
  _instance = null
  @getInstance: ( cls ) -> return _instance ?= new cls()

class ClassA
  prop: undefined
  constructor: () ->
    @prop = 'initialized'
    return

a = Singleton.getInstance( ClassA )
a.prop = 'changed'
b = Singleton.getInstance( ClassA )
console.log b.prop
