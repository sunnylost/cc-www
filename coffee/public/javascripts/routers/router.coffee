define (require, exports, module) ->

  $ = require 'jquery'
  Backbone = require 'backbone'
  
  Util = require '../common/util'
  RES = require '../common/res'
  common = require '../views/common'

  AppRouter = Backbone.Router.extend

    currentView: null
    
    initialize: ->
      self = @
      @common = common
      @res = RES
      @resLoaded = false

    routes:
      ''                : 'home'
      'page-:view'      : 'page'

    ## 载入资源文件
    loadRes: (callback) ->
      self = @

      if @resLoaded
        callback()
        return

      counter = 0

      for key of @res
        prefix = '?v=' + new Date().getTime()
        url = self.res[key] #+ prefix
        CC.funs.imgLoader url, (o) ->
          counter++
          if counter == Util.countLength self.res
            console.log 'res loaded'
            self.resLoaded = true
            # fadeout & remove landing wrapper
            $('.landing-status').addClass('fadeOutUp animated')
            setTimeout ->
              $landing = $('#landing')
              $landing.fadeOut()
              setTimeout ->
                $landing.remove()
              , 1000
              callback()
            , 1000

    # 首页
    home: ->
      @loadRes ->
        App = require '../views/main'
        $('.page').append '<div class="wrapper"></div>'
        new App

    pageCreditCloud: ->
      CcView = require '../views/creditcloud'
      new CcView el: $('.page')

    # 各个page view
    page: (page)->
      console.log 'page: ', page
      self = @

      @loadRes ->
        $('.page').append '<div class="wrapper"></div>'
        if page == 'cc'
          CcView = require '../views/creditcloud'
          new CcView el: $('.wrapper:last')

        if page == 'cc-about'
          console.log 'cc-about'

        if page == 'cc-'
          console.log 'cc-focus'


    switchView: (view) ->
      if @currentView
        @currentView.remove()

      @currentView = view

  module.exports = AppRouter
