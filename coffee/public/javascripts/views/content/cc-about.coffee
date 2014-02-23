define (require, exprots, module) ->
  
  $ = require 'jquery'
  Backbone = require 'backbone'
  _ = require 'underscore'

  Util = require '../../common/util'
  common = require '../common'
  RES = require '../../common/res'

  tpl = require '../../../tpl/cc-about.tpl'

  ThisView = Backbone.View.extend

    initialize: ->
      @common = common
      @render()

    events:
      'click button': 'button'

    render: ->
      self = @
      @$el.html _.template tpl
      @common.removeSubBody()
      setTimeout ->
        $text = self.$el.find('.animate-text')
        $text.css
          left: 100
        $text.addClass 'animated'
      , 1000
      @

    button: ->
      alert 'about'

  module.exports = ThisView
