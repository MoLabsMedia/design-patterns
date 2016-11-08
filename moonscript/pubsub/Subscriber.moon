class Subscriber
  new: ( name, data ) => 
    @name = name
    @data = data
    return
  update: ( msg, info ) =>
    -- 'info' could be: 
      -- string(s)
      -- action(s)
      -- ...
    print msg
    return

{ :Subscriber }


