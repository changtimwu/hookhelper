hh = require './hookhelper'

class xxp
  cfgs = { nports: 10, speed: 100}
  @rm_setcfg: (cfg) ->
    cfgs = cfg
    
  @rm_getcfg: (err, f) ->
    f cfgs

hh.hookize xxp
