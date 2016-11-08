class Template
  -- private properties: _prop = val
  
  -- private function: _function = () ->

  new: () => return
  render: () =>
    @genHeader()
    @genBody()
    @genFooter()
    return
  genHeader: () =>
  genBody: () =>
  genFooter: () =>

{ :Template }
