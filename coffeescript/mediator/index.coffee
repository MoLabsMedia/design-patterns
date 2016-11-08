class Colleague
  constructor: ( @mediator ) ->
  changed: -> @mediator.colleagueChanged( @ )

class ConcreteColleague1 extends Colleague
  event: -> @changed()
class ConcreteColleague2 extends Colleague
  event: -> @changed()

class Mediator
  colleagueChanged: ( colleague ) ->
class ConcreteMediator extends Mediator
  createColleagues: ->
    @colleague1 = new ConcreteColleague1( @ )
    @colleague2 = new ConcreteColleague2( @ )
    @colleague1.event()
    @colleague2.event()
  colleagueChanged: ( colleague ) ->
    if colleague instanceof ConcreteColleague1 then console.log 'colleague1 changed'
    else if colleague instanceof ConcreteColleague2 then console.log 'colleague2 changed'

class Example
  @run: ->
    m = new ConcreteMediator()
    m.createColleagues()
Example.run()
