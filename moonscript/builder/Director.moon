class Director
  new: ( @builder ) =>
  construct: ( structure ) =>
    for i, obj in ipairs structure
      print obj
      @builder\buildPart( obj )
    return

{ :Director }
