define (require, exports, module) ->
  
  $ = require 'jquery'
  Backbone = require 'backbone'
  _ = require 'underscore'

  Util = require '../common/util'
  RES = require '../common/res'
  #Mustache = require 'mustache'

  tpl = require '../../tpl/header.tpl'

  ThisView = Backbone.View.extend
    
    el: $('.header')

    initialize: ->
      @render()

    render: ->
      console.log 'render header...'
      header = _.template tpl, {logo: RES.landing}
      this.$el.find('.inner').html header

  module.exports = ThisView
