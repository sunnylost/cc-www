define (require, exprots, module) ->
  
  $ = require 'jquery'
  Backbone = require 'backbone'
  _ = require 'underscore'

  Util = require '../../common/util'
  RES = require '../../common/res'

  tpl = require '../../../tpl/cc-about.tpl'

  ThisView = Backbone.View.extend

    initialize: ->
      @render()

    events:
      'click button': 'button'

    render: ->
      console.log '##class->', @$el.attr 'class'
      @$el.html _.template tpl
      @

    button: ->
      alert 'about'

  module.exports = ThisView