hh = require './hookhelper'

internal_cfgs = { nports: 10, speed: 100}
    
rm_setcfg= (cfg) ->
  internal_cfgs = cfg
    
rm_getcfg= (err, f) ->
  f internal_cfgs

hh.hookize
  name: 'yyp'
  setcfg: rm_setcfg
  getcfg: rm_getcfg

