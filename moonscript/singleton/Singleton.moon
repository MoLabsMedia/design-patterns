class _Singleton
  new: () => 

class Singleton
  _instance = nil

  getInstance: () => 
    if not _instance then _instance = _Singleton()
    return _instance

{ :Singleton }
