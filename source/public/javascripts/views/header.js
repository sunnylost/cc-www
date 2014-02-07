(function() {
  define(function(require, exports, module) {
    var $, Backbone, RES, ThisView, Util, tpl, _;
    $ = require('jquery');
    Backbone = require('backbone');
    _ = require('underscore');
    Util = require('../common/util');
    RES = require('../common/res');
    tpl = require('../../tpl/header.tpl');
    ThisView = Backbone.View.extend({
      el: $('.header'),
      initialize: function() {
        return this.render();
      },
      render: function() {
        var header;
        console.log('render header...');
        header = _.template(tpl, {
          logo: RES.landing
        });
        return this.$el.find('.inner').html(header);
      }
    });
    return module.exports = ThisView;
  });

}).call(this);
