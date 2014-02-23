(function() {
  define(function(require, exprots, module) {
    var $, Backbone, RES, ThisView, Util, tpl, _;
    $ = require('jquery');
    Backbone = require('backbone');
    _ = require('underscore');
    Util = require('../../common/util');
    RES = require('../../common/res');
    tpl = require('../../../tpl/cc-about.tpl');
    ThisView = Backbone.View.extend({
      initialize: function() {
        return this.render();
      },
      events: {
        'click button': 'button'
      },
      render: function() {
        console.log('##class->', this.$el.attr('class'));
        this.$el.html(_.template(tpl));
        return this;
      },
      button: function() {
        return alert('about');
      }
    });
    return module.exports = ThisView;
  });

}).call(this);