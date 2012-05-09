Hook = require('hook.io').Hook
hb = new Hook( name: 'hello')

hb.on 'hook::ready', ->
  hb.emit 'xxp::getcfg', ( cfg)->
    console.log 'server xxp return:', cfg
    cfg.nports += 10
    hb.emit 'xxp::setcfg', cfg


hb.on 'hook::ready', ->
  hb.emit 'yyp::getcfg', ( cfg)->
    console.log 'server yyp return:', cfg
    cfg.nports += 10
    hb.emit 'yyp::setcfg', cfg



hb.start()

