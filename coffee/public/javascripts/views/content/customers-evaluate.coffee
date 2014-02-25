define (require, exprots, module) ->
  
  $ = require 'jquery'
  Backbone = require 'backbone'
  _ = require 'underscore'

  Util = require '../../common/util'
  common = require '../common'
  RES = require '../../common/res'

  tpl = require '../../../tpl/customers-evaluate.tpl'
  tpl_a = require '../../../tpl/detail-customers-1.tpl'
  tpl_b = require '../../../tpl/detail-customers-2.tpl'
  tpl_c = require '../../../tpl/detail-customers-3.tpl'

  ThisView = Backbone.View.extend

    initialize: ->
      @common = common
      @render()

    events:
      'click li': 'detail'

    render: ->
      self = @
      @$el.html _.template tpl
      @common.removeSubBody()
      setTimeout ->
        $text = self.$el.find('.animate-text')
        $text.css
          left: '5%'
        $text.addClass 'animated'
      , 1000
      @bindActions()

      @

    bindActions: ->
      @$el.find('.video-start').hover ->
        $(@).addClass 'animated pulse'
      , ->
        $(@).removeClass 'animated pulse'

    detail: (e) ->
      $this = $(e.currentTarget)
      self = @
      view = $this.data 'view'
      @renderDetail view

    renderDetail: (view) ->
      $section = $('.sub-section')
      $detail = $section.find('.detail-page')
      switch view
        when 'a'
        then _tpl = tpl_a

        when 'b'
        then _tpl = tpl_b

        when 'c'
        then _tpl = tpl_c
      $section.append _tpl
      $('.detail-page').addClass 'animated moveInRight'

      $('button.hide-detail').hover ->
        $(@).addClass 'animated pulse'
      , ->
        $(@).removeClass 'animated pulse'

      $('button.hide-detail').bind 'click', ->
        $('.detail-page').removeClass('moveInRight').addClass('moveOutRight')
        setTimeout ->
          $('.detail-page').remove()
        , 1000

  module.exports = ThisView
