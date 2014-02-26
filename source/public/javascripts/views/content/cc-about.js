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
        this.common.addAnimateText(this.$el);
        return this;
      },
      bindHover: function() {
        var timmer;
        timmer = null;
        return this.$el.find('td.ava').hover(function() {
          var $name, $title, h, margin, self, w, _content;
          self = this;
          w = $(this).width();
          h = $(this).height();
          $(this).removeClass('animated');
          $(this).removeClass('flipInY');
          $(this).removeClass('flipInX');
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
          return timmer = setTimeout(function() {
            $(self).removeClass('animated');
            $(self).removeClass('flipInY');
            $(self).removeClass('flipInX');
            return $(self).find('.ava-in').fadeOut();
          }, 200);
        });
      }
    });
    return module.exports = ThisView;
  });

}).call(this);
