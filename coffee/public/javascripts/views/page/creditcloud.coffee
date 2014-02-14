define (require, exports, module) ->
  
  $ = require 'jquery'
  Backbone = require 'backbone'
  _ = require 'underscore'

  Util = require '../../common/util'
  common = require '../common'

  tpl = require '../../../tpl/page.tpl'

  ThisView = Backbone.View.extend
    
    initialize: ->
      @$el.addClass 'view-cc-wp animated slow'
      @common = common
      @render()

    events:
      'click button': 'button'

    render: ->
      self = @
      $wrapper = $('.wrapper')
      @$el.html tpl
      
      HeaderView = require '../header/s-header'
      headerView = new HeaderView el: $("header.s-header")

      SubHeaderView = require '../header/sub-header'
      subHeaderView = new SubHeaderView el: $('.sub-header')
      @$el.find('li[data-view=cc]').addClass 'active'

      ContainerView = require '../content/cc-about'
      containerView = new ContainerView el: $('.sub-section .container-in')

      setTimeout ->
        CcFooterView = require '../footer/cc-footer'
        ccFooterView = new CcFooterView el: $('.sub-footer')
        self.common.resetContainer()
      , 300

      @$el.css({top:0}).addClass 'slideInUp'

      setTimeout ->
        if $wrapper.length > 1
          $wrapper.get(0).remove()
      , 1010

    button: ->
      alert 33333
      #Backbone.history.navigate '/', true

  module.exports = ThisView
