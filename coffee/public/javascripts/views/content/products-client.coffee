define (require, exprots, module) ->
  
  $ = require 'jquery'
  Backbone = require 'backbone'
  _ = require 'underscore'

  Util = require '../../common/util'
  common = require '../common'
  RES = require '../../common/res'

  tpl = require '../../../tpl/products-client.tpl'

  ThisView = Backbone.View.extend

    initialize: ->
      @common = common
      @render()

    render: ->
      self = @
      @$el.html _.template tpl
      @$el.addClass 'client-bg-1'
      @common.removeSubBody()
      setTimeout ->
        $text = self.$el.find('.animate-text')
        $text.css
          left: '10%'
        $text.addClass 'animated'
      , 1000
      @

  module.exports = ThisView
