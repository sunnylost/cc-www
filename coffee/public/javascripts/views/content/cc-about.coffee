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
      @bindHover()

    render: ->
      self = @
      @$el.html _.template tpl
      @common.removeSubBody()
      @common.addAnimateText @$el
      @

    bindHover: ->
      timmer = null
      @$el.find('td.ava').hover ->
        self = @
        w = $(@).width()
        h = $(@).height()

        $(@).removeClass 'animated'
        $(@).removeClass 'flipInY'
        $(@).removeClass 'flipInX'

        if $(@).hasClass 'fli-x'
          $(@).addClass 'animated flipInX'
        else
          $(@).addClass 'animated flipInY'

        $title = $(@).find('h3')
        $name = $(@).find('p')
        _content = $title.height() + $name.height()
        _content = 70
        margin = ($(@).height() - _content) / 2
        $title.css marginTop: margin

        # set ava-in position
        #$(self).find('.ava-in').css
        #  width: w
        #  height: h

        $(self).find('.ava-in').show()
      , ->
        self = @
        timmer = setTimeout ->
          $(self).removeClass 'animated'
          $(self).removeClass 'flipInY'
          $(self).removeClass 'flipInX'
          $(self).find('.ava-in').fadeOut()
        , 200

  module.exports = ThisView
