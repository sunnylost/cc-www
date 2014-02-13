define (require, exports, module) ->
  
  $ = require 'jquery'
  Backbone = require 'backbone'
  _ = require 'underscore'

  Util = require '../common/util'

  tpl = require '../../tpl/view-cc.tpl'

  ThisView = Backbone.View.extend
    
    initialize: ->
      @$el.addClass 'view-cc-wp animated slow'
      @render()

    events:
      'click header.sub-header li': 'subHeader'
      'click button': 'button'

    render: ->
      console.log 'render credit-cloud view...'
      $wrapper = $('.wrapper')

      @$el.html tpl
      HeaderView = require './s-header'
      headerView = new HeaderView el: $("header.s-header")

      #SectionView = require './section'
      #sectionView = new SectionView el: $('.container-in')

      ContentView = require './cc-footer'
      contentView = new ContentView el: $('footer.sub-footer')

      @$el.css({top:0}).addClass 'slideInUp'

      setTimeout ->
        if $wrapper.length > 1
          $wrapper.get(0).remove()
      , 1010

    subHeader: (e) ->
      self = @
      $this = $(e.currentTarget)
      
      sub_view = $this.data 'view'
      @$el.find('.sub-header li').removeClass 'active'
      $this.addClass 'active'
      switch sub_view
        when 'cc'
        then self.creditCloud()
        
        when 'products'
        then self.products()

        when 'customers'
        then self.customers()

    creditCloud: ->
      console.log 'creditcloud'

    products: ->
      console.log 'products'

    customers: ->
      console.log 'customers'

    button: ->
      alert 33333
      #Backbone.history.navigate '/', true

  module.exports = ThisView
