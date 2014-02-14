define (require, exports, module) ->
  
  $ = require 'jquery'
  Backbone = require 'backbone'
  _ = require 'underscore'

  Util = require '../../common/util'
  RES = require '../../common/res'

  tpl = require '../../../tpl/sub-header.tpl'

  ThisView = Backbone.View.extend

    id: 'ID-sub-header'
    className: 'sub-header'

    initialize: ->
      @render()

    events:
      'click li': 'subHeader'

    render: ->
      console.log 'render s-header...'
      html = _.template tpl, {logo: RES.landing}
      @$el.html html
      @

    subHeader: (e) ->
      self = @
      $this = $(e.currentTarget)

      sub_view = $this.data 'view'
      #@$el.find('li').removeClass 'active'
      #$this.addClass 'active'

      switch sub_view
        when 'cc'
        then self.creditCloud()
        
        when 'products'
        then self.products()

        when 'customers'
        then self.customers()

    creditCloud: ->
      console.log 'creditcloud'
      Backbone.history.navigate "/page-cc", true

    products: ->
      console.log 'products'
      Backbone.history.navigate "/page-products", true

    customers: ->
      console.log 'customers'
      Backbone.history.navigate "/page-customers", true


  module.exports = ThisView
