class Helper
  new: ( @info ) =>
  echo: () => 
    print @info
    return

class Singleton
  -- You can add statements inside the class definition which helps establish private scope ( due to closures ) instance is defined as null to force correct scope
  instance = null
  -- Create a private class that we can initialize however defined inside this scope to force the use of the singleton class\
  -- This is a static method used to either retrieve the instance or create a one\
  @instance: ( info ) =>
    return instance ?= Helper( info )

a = Singleton\instance( "Hello A" )
a\echo() -- => "Hello A"

b = Singleton\instance( "Hello B" )
b\echo() -- => "Hello A"
