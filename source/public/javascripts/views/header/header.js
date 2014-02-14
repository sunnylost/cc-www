(function() {
  define(function(require, exports, module) {
    var $, Backbone, RES, ThisView, Util, tpl, _;
    $ = require('jquery');
    Backbone = require('backbone');
    _ = require('underscore');
    Util = require('../../common/util');
    RES = require('../../common/res');
    tpl = require('../../../tpl/header.tpl');
    ThisView = Backbone.View.extend({
      id: 'ID-header',
      className: 'header',
      initialize: function() {
        return this.render();
      },
      events: {
        'click .logo': 'goHome'
      },
      render: function() {
        var html;
        console.log('render header...');
        html = _.template(tpl, {
          logo: RES.landing
        });
        this.$el.html(html);
        return this;
      },
      goHome: function() {
        return Backbone.history.navigate("/", true);
      }
    });
    return module.exports = ThisView;
  });

}).call(this);
