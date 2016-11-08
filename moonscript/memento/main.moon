import States from require 'States'

sts = States( 'begin' )
print sts.state
m = sts\save( 'doing' )
print sts.state
sts\restore()
print sts.state
