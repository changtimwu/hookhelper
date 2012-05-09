Hook = require('hook.io').Hook
hb = new Hook( name: 'clione', m:true)

hb.on 'hook::ready', ->
  hb.emit 'xxp::setcfg', {m:1}
  hb.on '*::xxp::link_change', (d)->
    console.log 'link changed ->', d
hb.start()

