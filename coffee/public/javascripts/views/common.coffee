define (require, exports, module) ->

  $ = require 'jquery'

  module.exports =
    
    resetContainer: ($container)->
      h_header = $('.s-header').height()
      h_subHeader = $('.sub-header').height()
      h_subFooter = $('.sub-footer').height()

      reset_height = $(window).height() - (h_header + h_subHeader + h_subFooter)
      $('.container-in').height reset_height

    createHeader: (el, callback) ->
      HeaderView = require './header'
      if $.isFunction el
        callback = el
        el = $('.wrapper')
      else
        el = el or $('.wrapper')

      html = """
        <header class="header" id="header"></header>
      """
      el.append html
      View = new HeaderView el: $(".header")

      if callback
        callback(View)

    createContainer: (el, callback) ->
      ContainerView = require './container'
      if $.isFunction el
        callback = el
        el = $('.wrapper')
      else
        el = el or $('.wrapper')

      html = """
        <div class="container" id="home-container"></div>
      """
      el.append html
      View = new ContainerView el: $(".container")

      if callback
        callback(View)

    createFooter: (el, callback) ->
      FooterView = require './footer'
      if $.isFunction el
        callback = el
        cl = $('.wrapper')
      else
        el = el or $('.wrapper')

      html = """
        <footer class="footer" id="footer"></footer>
      """
      el.append html
      View = new FooterView el: $(".footer")
      
      if callback
        callback(View)

    createCreditCloud: (el, callback) ->
      CcView = require './creditcloud'
      if $.isFunction el
        callback = el
        el = $('.wrapper')
      else
        el = el or $('.wrapper')

      html = """
        <div class="container"></div>
      """
      el.append html
      View = new CcView el: $('.wrapper')

      if callback
        callback(View)

