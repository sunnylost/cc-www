define (require, exports, module) ->
  
  $ = require 'jquery'
  Backbone = require 'backbone'
  _ = require 'underscore'

  Util = require '../common/util'
  RES = require '../common/res'

  tpl = require '../../tpl/s-header.tpl'

  ThisView = Backbone.View.extend

    id: 'ID-s-header'
    className: 's-header'

    initialize: ->
      @render()

    events:
      'click .logo': 'goHome'
      'click .go-back': 'back'

    render: ->
      console.log 'render s-header...'
      html = _.template tpl, {logo: RES.landing}
      @$el.html html
      @

    goHome: ->
      Backbone.history.navigate "/", true

    back: ->
      window.history.back -1

  module.exports = ThisView
