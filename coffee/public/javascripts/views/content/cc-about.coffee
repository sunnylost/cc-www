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
      setTimeout ->
        $text = self.$el.find('.animate-text')
        $text.css
          left: 100
        $text.addClass 'animated'
      , 1000
      @

    bindHover: ->
      #@$el.find('td.ava').hover ->
      #  if $(@).hasClass 'fli-x'
      #    $(@).addClass 'animated flipInX'
      #  else
      #    $(@).addClass 'animated flipInY'
      #, ->
      #  $(@).removeClass 'animated flipInY flipInX'

      @$el.find('td.ava').hover ->
        self = @
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
        $(self).find('.ava-in').show()
      , ->
        self = @
        $(@).removeClass 'animated flipInY flipInX'
        $(self).find('.ava-in').fadeOut()

  module.exports = ThisView
