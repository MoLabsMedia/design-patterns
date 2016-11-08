import Singleton from require 'Singleton'

s1 = Singleton\getInstance()
s2 = Singleton\getInstance()

print s1
print s2

if s1 == s2 then print 'the same'
