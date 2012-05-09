hh = require './hookhelper'

class xxp
  cfgs = { nports: 10, speed: 100}
  dostuff: ->
    chtimes=0
    setInterval (=>
      newstat = if chtimes % 2 then 'up' else 'down'
      chtimes+=1
      @emit 'link_change', port:{ no: 5, stat: newstat}
    ), 3000
  @rm_setcfg: (cfg) ->
    cfgs = cfg
  @rm_getcfg: (err, f) ->
    f cfgs

hh.hookize xxp
xxpc = new xxp
xxpc.dostuff()

