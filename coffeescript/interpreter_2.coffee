# --------------
# CREDIT: http://coffeescript-cookbook.github.io/chapters/design_patterns/interpreter
# --------------

class StackCalculator
  parseString: ( string ) ->
    @stack = []
    for token in string.split /\s+/
      @parseToken( token )

    if @stack.length > 1
      throw "Not enough operators: numbers left over"
    else
      return @stack[0]
    return
  parseToken: ( token, lastNumber ) ->
    if isNaN parseFloat( token ) # Assume that anything other than a number is an operator
      @parseOperator( token )
    else
      @stack.push( parseFloat( token ) )
    return
  parseOperator: ( operator ) ->
    if @stack.length < 2
      throw "Can't operate on a stack without at least 2 items"
    right = @stack.pop()
    left = @stack.pop()
    result = switch operator
      when "+" 
        left + right
      when "-" 
        left - right
      when "*" 
        left * right
      when "/"
        if right is 0
          throw "Can't divide by 0"
        else
          left/right
      else
        throw "Unrecognized operator: #{operator}"
    @stack.push( result )
    return

calc = new StackCalculator
calc.parseString( "5 5 +" ) # => { result: 10 }
calc.parseString( "4.0 5.5 +" ) # => { result: 9.5 }
calc.parseString( "5 5 + 55 + *" ) # => { result: 100 }

try
  calc.parseString( "5 0 /" )
catch err
  console.log err # => "Can't divide by 0"

try
  calc.parseString( "5 -" )
catch err
  console.log err # => "Can't operate on a stack without at least 2 items"

try
  calc.parseString( "5 5 5 -" )
catch err
  console.log err # => "Not enough operators: numbers left over"

try
  calc.parseString( "5 5 5 foo" )
catch err
  console.log err # => "Unrecognized operator: foo"
