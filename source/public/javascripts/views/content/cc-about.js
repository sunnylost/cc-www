(function() {
  define(function(require, exprots, module) {
    var $, Backbone, RES, ThisView, Util, common, tpl, _;
    $ = require('jquery');
    Backbone = require('backbone');
    _ = require('underscore');
    Util = require('../../common/util');
    common = require('../common');
    RES = require('../../common/res');
    tpl = require('../../../tpl/cc-about.tpl');
    ThisView = Backbone.View.extend({
      initialize: function() {
        this.common = common;
        return this.render();
      },
      events: {
        'click button': 'button'
      },
      render: function() {
        var self;
        self = this;
        this.$el.html(_.template(tpl));
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
      button: function() {
        return alert('about');
      }
    });
    return module.exports = ThisView;
  });

}).call(this);
