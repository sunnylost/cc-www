define (require, exports, module) ->
  
  $ = require 'jquery'
  Backbone = require 'backbone'
  _ = require 'underscore'

  tpl = require '../../tpl/footer.tpl'

  ThisView = Backbone.View.extend
    
    initialize: ->
      @render()

    events:
      'click li.view-cc': 'viewCreditCloud'
      'click li.view-products': 'viewProducts'
      'click li.view-customers': 'viewCustomers'

    render: ->
      console.log 'render footer...'
      @$el.html _.template tpl, {}
      @

    viewCreditCloud: (e)->
      Backbone.history.navigate "/page-cc", true

    viewProducts: ->
      console.log 'viewProducts'

    viewCustomers: ->
      console.log 'viewCustomers'

  module.exports = ThisView
