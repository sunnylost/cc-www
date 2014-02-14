define (require, exports, module) ->
  
  $ = require 'jquery'
  Backbone = require 'backbone'
  _ = require 'underscore'

  Util = require '../../common/util'
  RES = require '../../common/res'

  tpl = require '../../../tpl/header.tpl'

  ThisView = Backbone.View.extend

    id: 'ID-header'
    className: 'header'

    initialize: ->
      @render()

    events:
      'click .logo': 'goHome'

    render: ->
      console.log 'render header...'
      html = _.template tpl, {logo: RES.landing}
      @$el.html html
      @

    goHome: ->
      Backbone.history.navigate "/", true
      #ContainerView = require './container'
      #new ContainerView

  module.exports = ThisView
