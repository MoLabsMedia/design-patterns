import Pub from require 'Publisher'
import Sub from require 'Subscriber'

s1 = Sub( 'a', {
  'start': () -> return 'do something about s1 at start'
  'end': () -> return 'do something about s1 in the end'
} )
s2 = Sub( 'b', {
  'start': () -> return 'do something about s2 at start'
  'end': () -> return 'do something about s2 in the end'
} )

with Pub()
  \addSub( s1 )
  \addSub( s2 )
  \updateSubs( 'start', 'it starts.' )
  \updateSubs( 'end', 'it ends.' )
  
