-- Using a private variable to simulate external scripts or modules
increment = ( () =>
  _counter = 0

  byOne = () =>
    _counter += 1
    return

  byTwo = () =>
    _counter += 2
    return
  
  commands = {
    single: byOne
    double: byTwo
    value: () => 
      print _counter
      return 
  }
)()

class Runner
  new: ( @commands\\\ ) =>
  run: () => 
    for command in @commands
      command() 
    return

runner = Runner( increment\single, increment\double, increment\single, increment\double )
runner\run()
increment\value()
