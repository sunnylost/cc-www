(function() {
  define(function(require, exports, module) {
    var $, Backbone, RES, ThisView, Util, _;
    $ = require('jquery');
    Backbone = require('backbone');
    _ = require('underscore');
    Util = require('../common/util');
    RES = require('../common/res');
    ThisView = Backbone.View.extend({
      el: $('body'),
      initialize: function() {
        var self;
        self = this;
        this.res = RES;
        return this.loadRes(function() {
          return self.render();
        });
      },
      render: function() {
        console.log('render views/main');
        return setTimeout(function() {
          var HeaderView;
          HeaderView = require('./header');
          new HeaderView;
          $('#landing').addClass('fadeOutUp animated');
          return setTimeout(function() {
            return $('#landing').remove();
          }, 1000);
        }, 1000);
      },
      loadRes: function(callback) {
        var counter, key, prefix, self, url, _results;
        self = this;
        counter = 0;
        _results = [];
        for (key in this.res) {
          prefix = '?v=' + new Date().getTime();
          url = self.res[key];
          _results.push(CC.funs.imgLoader(url, function(o) {
            console.log('loaded->', o);
            counter++;
            if (counter === Util.countLength(self.res)) {
              return callback();
            }
          }));
        }
        return _results;
      }
    });
    return module.exports = ThisView;
  });

}).call(this);
