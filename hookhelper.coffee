Hook = require('hook.io').Hook

console.log 'service hooks start'

hookh = new Hook( name: 'hello')
hookh.start()

hookcls = ( cls) ->
  if cls instanceof Function and cls.name
    cls.prototype.emit = (evname, arg)->
      hookh.emit "#{cls.name}::#{evname}", arg
    for rmfn, f of cls when rmfn.indexOf('rm_')==0
      fn = rmfn.substr( 3)
      hookh.on "*::#{cls.name}::#{fn}", f
  else if cls instanceof Object
    for rmfn, f of cls
      continue if rmfn == 'name'
      hookh.on "*::#{cls.name}::#{rmfn}", f

exports.hookize = hookcls
exports.hookhandler = hookh
