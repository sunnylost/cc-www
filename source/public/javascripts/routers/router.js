(function() {
  define(function(require, exports, module) {
    var $, AppRouter, Backbone, RES, Util, common;
    $ = require('jquery');
    Backbone = require('backbone');
    Util = require('../common/util');
    RES = require('../common/res');
    common = require('../views/common');
    AppRouter = Backbone.Router.extend({
      currentView: null,
      initialize: function() {
        var self;
        self = this;
        this.common = common;
        this.res = RES;
        return this.resLoaded = false;
      },
      routes: {
        '': 'home',
        'page-:view': 'page'
      },
      loadRes: function(callback) {
        var counter, key, prefix, self, url, _results;
        self = this;
        if (this.resLoaded) {
          callback();
          return;
        }
        counter = 0;
        _results = [];
        for (key in this.res) {
          prefix = '?v=' + new Date().getTime();
          url = self.res[key];
          _results.push(CC.funs.imgLoader(url, function(o) {
            counter++;
            if (counter === Util.countLength(self.res)) {
              console.log('res loaded');
              self.resLoaded = true;
              $('.landing-status').addClass('fadeOutUp animated');
              return setTimeout(function() {
                var $landing;
                $landing = $('#landing');
                $landing.fadeOut();
                setTimeout(function() {
                  return $landing.remove();
                }, 1000);
                return callback();
              }, 1000);
            }
          }));
        }
        return _results;
      },
      home: function() {
        return this.loadRes(function() {
          var App;
          App = require('../views/main');
          $('.page').append('<div class="wrapper"></div>');
          return new App;
        });
      },
      pageCreditCloud: function() {
        var CcView;
        CcView = require('../views/creditcloud');
        return new CcView({
          el: $('.page')
        });
      },
      page: function(page) {
        var self;
        console.log('page: ', page);
        self = this;
        return this.loadRes(function() {
          var CcView;
          $('.page').append('<div class="wrapper"></div>');
          if (page === 'cc') {
            CcView = require('../views/creditcloud');
            new CcView({
              el: $('.wrapper:last')
            });
          }
          if (page === 'cc-about') {
            console.log('cc-about');
          }
          if (page === 'cc-') {
            return console.log('cc-focus');
          }
        });
      },
      switchView: function(view) {
        if (this.currentView) {
          this.currentView.remove();
        }
        return this.currentView = view;
      }
    });
    return module.exports = AppRouter;
  });

}).call(this);
