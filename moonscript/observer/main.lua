local Observer
Observer = require('Observer').Observer
local Subject
Subject = require('Subject').Subject
local o1 = Observer('a')
local o2 = Observer('b')
local o3 = Observer('c')
do
  local _with_0 = Subject()
  _with_0:addObs(o1)
  _with_0:addObses(o2, o3)
  _with_0:updateObses('here here here')
  return _with_0
end
