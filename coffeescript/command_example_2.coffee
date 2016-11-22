# --------------
# CREDIT: http://coffeescript-cookbook.github.io/chapters/design_patterns/command
# --------------

# Using a private variable to simulate external scripts or modules
increment = ( () ->
  _counter = 0

  byOne = () ->
    _counter += 1
    return

  byTwo = () ->
    _counter += 2
    return
  
  commands = {
    single: byOne
    double: byTwo
    value: () -> 
      console.log _counter
      return 
  }
)()

class Runner
  constructor: ( @commands... ) ->
  run: -> 
    for command in @commands
      command() 
    return

runner = new Runner( increment.single, increment.double, increment.single, increment.double )
runner.run()
increment.value()
