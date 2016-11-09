class AbstractColleague
  constructor: ( @mediator ) ->
  fireEvent: -> 
    @change()
    return
  change: -> 
    @mediator.changeColleague( @ )
    return

class ConcreteColleagueA extends AbstractColleague
class ConcreteColleagueB extends AbstractColleague

class Mediator
  changeColleague: ( colleague ) ->
class ConcreteMediator extends Mediator
  createColleagues: ->
    @colleague1 = new ConcreteColleagueA( @ )
    @colleague2 = new ConcreteColleagueB( @ )
    @colleague1.fireEvent()
    @colleague2.fireEvent()
    return
  changeColleague: ( colleague ) ->
    if colleague instanceof ConcreteColleagueA 
      console.log 'colleague1 changed'
    else if colleague instanceof ConcreteColleagueB 
      console.log 'colleague2 changed'
    else 
      console.log 'nothing happened'
    return

class Main
  @run: ->
    m = new ConcreteMediator()
    m.createColleagues()

Main.run()
