define (require, exports, module) ->
  
  $ = require 'jquery'
  Backbone = require 'backbone'
  _ = require 'underscore'

  Util = require '../../common/util'
  RES = require '../../common/res'

  tpl = require '../../../tpl/products-footer.tpl'

  ThisView = Backbone.View.extend

    id: 'ID-s-footer'

    initialize: ->
      @render()

    events:
      'click .logo': 'goHome'
      'click .go-home': 'goHome'

    render: ->
      console.log 'render products-footer...'
      html = _.template tpl, {logo: RES.landing}
      @$el.html html
      @

    goHome: ->
      Backbone.history.navigate "/", true

  module.exports = ThisView
