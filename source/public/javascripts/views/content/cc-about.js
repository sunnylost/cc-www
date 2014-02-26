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
        this.render();
        return this.bindHover();
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
            left: '10%'
          });
          return $text.addClass('animated');
        }, 1000);
        return this;
      },
      bindHover: function() {
        return this.$el.find('td.ava').hover(function() {
          var $name, $title, margin, self, _content;
          self = this;
          if ($(this).hasClass('fli-x')) {
            $(this).addClass('animated flipInX');
          } else {
            $(this).addClass('animated flipInY');
          }
          $title = $(this).find('h3');
          $name = $(this).find('p');
          _content = $title.height() + $name.height();
          _content = 70;
          margin = ($(this).height() - _content) / 2;
          $title.css({
            marginTop: margin
          });
          return $(self).find('.ava-in').show();
        }, function() {
          var self;
          self = this;
          $(this).removeClass('animated flipInY flipInX');
          return $(self).find('.ava-in').fadeOut();
        });
      }
    });
    return module.exports = ThisView;
  });

}).call(this);
