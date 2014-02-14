define (require, exports, module) ->

  $ = require 'jquery'

  module.exports =
    
    resetContainer: ($container)->
      h_header = $('.s-header').height()
      h_subHeader = $('.sub-header').height()
      h_subFooter = $('.sub-footer').height()

      reset_height = $(window).height() - (h_header + h_subHeader + h_subFooter)
      $('.container-in').height reset_height

    showSubFooter: ->
      $('.sub-footer').css 'visibility', 'visible'

