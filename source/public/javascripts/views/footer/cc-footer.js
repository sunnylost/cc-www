(function() {
  define(function(require, exports, module) {
    var $, Backbone, RES, ThisView, Util, tpl, _;
    $ = require('jquery');
    Backbone = require('backbone');
    _ = require('underscore');
    Util = require('../../common/util');
    RES = require('../../common/res');
    tpl = require('../../../tpl/cc-footer.tpl');
    ThisView = Backbone.View.extend({
      id: 'ID-s-footer',
      initialize: function() {
        return this.render();
      },
      events: {
        'click .logo': 'goHome',
        'click .go-home': 'goHome'
      },
      render: function() {
        var html;
        console.log('render cc-footer...');
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
