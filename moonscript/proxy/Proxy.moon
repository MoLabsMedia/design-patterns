import Subject from require 'Subject'
import RealSubject from require 'RealSubject'
class Proxy extends Subject
  request: () =>
    @realSubject = RealSubject() if not @realSubject
    @realSubject\request()

{ :Proxy }
