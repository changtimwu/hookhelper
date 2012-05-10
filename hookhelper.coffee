fs = require 'fs'
Hook = require('hook.io').Hook

console.log 'service hooks start'

config = JSON.parse fs.readFileSync('config.json')
hookh = new Hook(config)
hookh.start()

peer = config.peer?='*'
hookcls = ( cls) ->
  if cls instanceof Function and cls.name
    cls.prototype.emit = (evname, arg)->
      hookh.emit "#{cls.name}::#{evname}", arg
    for rmfn, f of cls when rmfn.indexOf('rm_')==0
      fn = rmfn.substr( 3)
      hookh.on "#{peer}::#{cls.name}::#{fn}", f
  else if cls instanceof Object
    for rmfn, f of cls
      continue if rmfn == 'name'
      hookh.on "#{peer}::#{cls.name}::#{rmfn}", f
exports.hookize = hookcls
exports.hookhandler = hookh
