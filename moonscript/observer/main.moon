import Observer from require 'Observer'
import Subject from require 'Subject'

o1 = Observer( 'a' )
o2 = Observer( 'b' )
o3 = Observer( 'c' )

with Subject()
  \addObs( o1 )
  \addObses( o2, o3 )
  \updateObses( 'here here here' )
