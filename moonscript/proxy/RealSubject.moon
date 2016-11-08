import Subject from require 'Subject'
class RealSubject extends Subject
  request: () => print 'Real subject'

{ :RealSubject }
