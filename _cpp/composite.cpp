class AbstractNode
  constructor: -> 
    @list = []
    return
  show: -> 
    console.log @list
    return
class EndNode extends AbstractNode
class CompositeNode extends AbstractNode
  add: ( comp ) -> @list.push comp

class Main
  @run: ->
    comp = new CompositeNode()
    end = new EndNode()
    comp.add( end )
    comp.show()
    another_comp = new CompositeNode()
    comp.add( another_comp )
    comp.show()
    return

Main.run()
