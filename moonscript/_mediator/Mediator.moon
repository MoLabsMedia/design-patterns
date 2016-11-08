class Mediator
  -- private properties: _prop = val
  _topics = {}
  _col = {}
  
  -- private function: _function = () ->

  new: ( cols ) =>
    _cols = cols if cols
    return
  subscribe: ( topic, info ) =>
    _topics.topic = {} if !_topics.topic
    table.insert( _topics.topic, info )
    return
  publish: ( topic ) =>
    return false if !_topics.topic
    for i, info in ipairs _topics.topic
      -- do something with info
    return 


{ :Mediator }
