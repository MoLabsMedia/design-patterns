# --------------
# CREDIT: http://coffeescript-cookbook.github.io/chapters/design_patterns/observer
# --------------

class PostOffice
  constructor: () ->
    @subscribers = []
  notifyNewItemReleased: ( item ) ->
    subscriber.callback( item ) for subscriber in @subscribers when subscriber.item is item
    return
  subscribe: ( genre, newItemReleasedHandler ) ->
    @subscribers.push { 'item': genre, 'callback': newItemReleasedHandler }
    return

class MagazineSubscriber
  newMagazineHandler: ( item ) ->
    console.log "I've got new " + item
    return

class NewspaperSubscriber
  newNewspaperHandler: ( item ) ->
    console.log "I've got new " + item
    return

postOffice = new PostOffice()
sub1 = new MagazineSubscriber()
sub2 = new NewspaperSubscriber()
postOffice.subscribe( "Mens Health", sub1.newMagazineHandler )
postOffice.subscribe( "Times", sub2.newNewspaperHandler )
postOffice.notifyNewItemReleased( "Times" )
postOffice.notifyNewItemReleased( "Mens Health" )
