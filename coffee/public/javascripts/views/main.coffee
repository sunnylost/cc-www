define (require, exports, module) ->

  $ = require 'jquery'
  Backbone = require 'backbone'
  _ = require 'underscore'

  Util = require '../common/util'
  RES = require '../common/res'

  ThisView = Backbone.View.extend
    
    el: $('body')

    initialize: ->
      self = @

      @res = RES
      @loadRes ->
        self.render()

    render: ->
      console.log 'render views/main'
      setTimeout ->
        HeaderView = require './header'
        new HeaderView
        $('#landing').addClass('fadeOutUp animated')
        setTimeout ->
          $('#landing').remove()
        , 1000
      , 1000

    loadRes: (callback)->
      self = @
      counter = 0

      for key of @res
        prefix = '?v=' + new Date().getTime()
        url = self.res[key] #+ prefix
        #self.loader url
        CC.funs.imgLoader url, (o) ->
          console.log 'loaded->', o
          counter++
          if counter == Util.countLength self.res
            callback()


  module.exports = ThisView
