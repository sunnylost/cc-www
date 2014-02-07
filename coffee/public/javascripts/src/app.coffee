define (require) ->

  window.CC = {}
  CC.funs = require '../common/globalFuns'

  App = require '../views/main'

  new App

