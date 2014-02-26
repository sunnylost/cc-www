define (require, exprots, module) ->
  
  $ = require 'jquery'
  Backbone = require 'backbone'
  _ = require 'underscore'

  Util = require '../../common/util'
  common = require '../common'
  RES = require '../../common/res'

  tpl = require '../../../tpl/products-site.tpl'

  ThisView = Backbone.View.extend

    initialize: ->
      @common = common
      @render()
      @bindActions()

    render: ->
      self = @
      @$el.html _.template tpl
      @$el.addClass 'site-bg-1'
      @common.removeSubBody()
      setTimeout ->
        $text = self.$el.find('.animate-text')
        $text.css
          left: 100
        $text.addClass 'animated'
      , 1000
      @

    bindActions: ->
      console.log 333333
      $body = $('.sub-body')
      arr = [
        RES.banner_pro_1
        RES.banner_pro_2
        RES.banner_pro_3
        RES.banner_pro_4
      ]
      setTimeout ->
        len = arr.length
        currentImg = 0
        window.bgTimmer = setInterval ->
          console.log currentImg
          if currentImg+1 == len
            currentImg = 0
          else
            currentImg++
        , 3000
      , 1000

  module.exports = ThisView
