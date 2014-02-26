(function() {
  define(function(require, exprots, module) {
    var $, Backbone, RES, ThisView, Util, common, tpl, _;
    $ = require('jquery');
    Backbone = require('backbone');
    _ = require('underscore');
    Util = require('../../common/util');
    common = require('../common');
    RES = require('../../common/res');
    tpl = require('../../../tpl/products-site.tpl');
    ThisView = Backbone.View.extend({
      initialize: function() {
        this.common = common;
        this.render();
        return this.bindActions();
      },
      render: function() {
        var self;
        self = this;
        this.$el.html(_.template(tpl));
        this.$el.addClass('site-bg-1');
        this.common.removeSubBody();
        setTimeout(function() {
          var $text;
          $text = self.$el.find('.animate-text');
          $text.css({
            left: 100
          });
          return $text.addClass('animated');
        }, 1000);
        return this;
      },
      bindActions: function() {
        var $body, arr;
        console.log(333333);
        $body = $('.sub-body');
        arr = [RES.banner_pro_1, RES.banner_pro_2, RES.banner_pro_3, RES.banner_pro_4];
        return setTimeout(function() {
          var currentImg, len;
          len = arr.length;
          currentImg = 0;
          return window.bgTimmer = setInterval(function() {
            console.log(currentImg);
            if (currentImg + 1 === len) {
              return currentImg = 0;
            } else {
              return currentImg++;
            }
          }, 3000);
        }, 1000);
      }
    });
    return module.exports = ThisView;
  });

}).call(this);
