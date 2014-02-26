define (require, exprots, module) ->
  
  $ = require 'jquery'
  Backbone = require 'backbone'
  _ = require 'underscore'

  Util = require '../../common/util'
  common = require '../common'
  RES = require '../../common/res'

  tpl = require '../../../tpl/products-operations.tpl'
  tpl_a = require '../../../tpl/detail-products-oper-1.tpl'
  tpl_b = require '../../../tpl/detail-products-oper-2.tpl'
  tpl_c = require '../../../tpl/detail-products-oper-3.tpl'

  ThisView = Backbone.View.extend

    initialize: ->
      @common = common
      @render()

    events:
      'click li': 'detail'

    render: ->
      self = @
      @$el.html _.template tpl
      @$el.addClass 'oper-bg-1'
      @common.removeSubBody()
      @common.addAnimateText @$el
      @

    detail: (e) ->
      $this = $(e.currentTarget)
      self = @
      view = $this.data 'view'
      @renderDetail view

    renderDetail: (view) ->
      $section = $('.sub-section')
      $detail = $section.find('.detail-page')
      switch view
        when 'tech-a'
        then _tpl = tpl_a

        when 'tech-b'
        then _tpl = tpl_b

        when 'tech-c'
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
