class PostOffice
  new: () =>
    @subscribers = {}
  notifyNewItemReleased: ( item ) =>
    subscriber\callback( item ) for subscriber in @subscribers when subscriber\item is item
    return
  subscribe: ( genre, newItemReleasedHandler ) =>
    @subscribers\push { 'item': genre, 'callback': newItemReleasedHandler }
    return

class MagazineSubscriber
  newMagazineHandler: ( item ) =>
    print "I've got " + item
    return

class NewspaperSubscriber
  newNewspaperHandler: ( item ) =>
    print "I've got " + item
    return

postOffice = PostOffice()
sub1 = MagazineSubscriber()
sub2 = NewspaperSubscriber()
postOffice\subscribe( "Mens Health", sub1\newMagazineHandler )
postOffice\subscribe( "Times", sub2\newNewspaperHandler )
postOffice\notifyNewItemReleased( "Times" )
postOffice\notifyNewItemReleased( "Mens Health" )
