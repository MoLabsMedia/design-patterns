class AbstractColleague
  new: ( @mediator ) =>
  fireEvent: () => 
    @change()
    return
  change: () => 
    @mediator\changeColleague( @ )
    return

class ConcreteColleagueA extends AbstractColleague
class ConcreteColleagueB extends AbstractColleague

class Mediator
  changeColleague: ( colleague ) =>
class ConcreteMediator extends Mediator
  createColleagues: () =>
    @colleague1 = ConcreteColleagueA( @ )
    @colleague2 = ConcreteColleagueB( @ )
    @colleague1\fireEvent()
    @colleague2\fireEvent()
    return
  changeColleague: ( colleague ) =>
    if colleague instanceof ConcreteColleagueA 
      print 'colleague1 changed'
    else if colleague instanceof ConcreteColleagueB 
      print 'colleague2 changed'
    else 
      print 'nothing happened'
    return

class Main
  @run: () =>
    m = ConcreteMediator()
    m\createColleagues()

Main.run()
