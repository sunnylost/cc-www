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
        return this.render();
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
            left: '10%'
          });
          return $text.addClass('animated');
        }, 1000);
        return this;
      },
      bindActions: function() {
        var $body, arr, self;
        console.log(333333);
        self = this;
        $body = $('.sub-body');
        arr = [RES.banner_pro_1, RES.home, RES.banner_a, RES.banner_b];
        return setTimeout(function() {
          var currentImg, len;
          len = arr.length;
          currentImg = 0;
          return window.bgTimmer = setInterval(function() {
            console.log(currentImg);
            self.$el.attr('style', "background-image: url(" + arr[currentImg] + ")");
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
