import Strategy from require 'Strategy'

printArray = ( arr ) -> 
  result = '{ '
  result ..= table.concat( arr, ', ' )
  result ..= ' }'
  print result
  return 

printObject = ( obj ) -> 
  result = '{ '
  for key, val in pairs obj
    result ..= key .. ': ' .. val .. ', '
  result ..= ' }'
  print result
  return 


a = { 1,2,3 }
b = {
  a: 1,
  b: 2,
  c: 3
}
stg = Strategy( printArray )
stg\applyAlgorithm( a )
stg\useAlgorithm( printObject )
stg\applyAlgorithm( b )

