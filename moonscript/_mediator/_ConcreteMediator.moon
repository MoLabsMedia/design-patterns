import Mediator from require 'Mediator'
import ConcreteColleague1 from require 'ConcreteColleague1'
import ConcreteColleague2 from require 'ConcreteColleague2'
class ConcreteMediator extends Mediator
  createColleagues: () =>
    @colleague1 = ConcreteColleague1( @ )
    @colleague2 = ConcreteColleague2( @ )
    @colleague1\event()
    @colleague2\event()
  colleagueChanged: ( colleague ) =>
    if colleague.__class == ConcreteColleague1 then print 'colleague1 changed'
    else if colleague.__class == ConcreteColleague2 then print 'colleague2 changed'

{ :ConcreteMediator }
