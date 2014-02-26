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
      #@bindActions()

    render: ->
      self = @
      @$el.html _.template tpl
      @$el.addClass 'site-bg-1'
      @common.removeSubBody()
      @common.addAnimateText @$el
      @

    bindActions: ->
      console.log 333333
      self = @
      $body = $('.sub-body')
      arr = [
        RES.banner_pro_1
        RES.home
        RES.banner_a
        RES.banner_b
      ]
      setTimeout ->
        len = arr.length
        currentImg = 0
        window.bgTimmer = setInterval ->
          console.log currentImg
          #self.$el.css 'background-image', arr[currentImg
          self.$el.attr 'style', "background-image: url(#{arr[currentImg]})"
          #self.$el.html arr[currentImg]
          if currentImg+1 == len
            currentImg = 0
          else
            currentImg++
        , 3000
      , 1000

  module.exports = ThisView
