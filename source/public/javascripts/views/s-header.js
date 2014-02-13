(function() {
  define(function(require, exports, module) {
    var $, Backbone, RES, ThisView, Util, tpl, _;
    $ = require('jquery');
    Backbone = require('backbone');
    _ = require('underscore');
    Util = require('../common/util');
    RES = require('../common/res');
    tpl = require('../../tpl/s-header.tpl');
    ThisView = Backbone.View.extend({
      id: 'ID-s-header',
      className: 's-header',
      initialize: function() {
        return this.render();
      },
      events: {
        'click .logo': 'goHome',
        'click .go-back': 'back'
      },
      render: function() {
        var html;
        console.log('render s-header...');
        html = _.template(tpl, {
          logo: RES.landing
        });
        this.$el.html(html);
        return this;
      },
      goHome: function() {
        return Backbone.history.navigate("/", true);
      },
      back: function() {
        return window.history.back(-1);
      }
    });
    return module.exports = ThisView;
  });

}).call(this);
