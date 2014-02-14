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
      @$el.find('li[data-view=products]').addClass 'active'

      setTimeout ->
        FooterView = require '../footer/products-footer'
        footerView = new FooterView el: $('footer.sub-footer')
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
