(function() {
  define(function(require, exports, module) {
    var $, Backbone, ThisView, tpl, _;
    $ = require('jquery');
    Backbone = require('backbone');
    _ = require('underscore');
    tpl = require('../../tpl/footer.tpl');
    ThisView = Backbone.View.extend({
      initialize: function() {
        return this.render();
      },
      events: {
        'click li.view-cc': 'viewCreditCloud',
        'click li.view-products': 'viewProducts',
        'click li.view-customers': 'viewCustomers'
      },
      render: function() {
        console.log('render footer...');
        this.$el.html(_.template(tpl, {}));
        return this;
      },
      viewCreditCloud: function(e) {
        return Backbone.history.navigate("/page-cc", true);
      },
      viewProducts: function() {
        return console.log('viewProducts');
      },
      viewCustomers: function() {
        return console.log('viewCustomers');
      }
    });
    return module.exports = ThisView;
  });

}).call(this);
