Hook = require('hook.io').Hook
hb = new Hook( name: 'hello')

hb.on 'hook::ready', ->
  hb.on 'xxp::link_change', (d)->
    console.log 'link changed ->', d
hb.start()

