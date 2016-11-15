class AbstractNode
  new: () => 
    @list = {}
    return
  show: () => 
    print @list
    return
class EndNode extends AbstractNode
class CompositeNode extends AbstractNode
  add: ( comp ) => @list\push comp

class Main
  @run: () =>
    comp = CompositeNode()
    end = EndNode()
    comp\add( end )
    comp\show()
    another_comp = CompositeNode()
    comp\add( another_comp )
    comp\show()
    return

Main.run()
