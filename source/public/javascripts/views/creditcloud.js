(function() {
  define(function(require, exports, module) {
    var $, Backbone, ThisView, Util, tpl, _;
    $ = require('jquery');
    Backbone = require('backbone');
    _ = require('underscore');
    Util = require('../common/util');
    tpl = require('../../tpl/view-cc.tpl');
    ThisView = Backbone.View.extend({
      initialize: function() {
        this.$el.addClass('view-cc-wp animated slow');
        return this.render();
      },
      events: {
        'click header.sub-header li': 'subHeader',
        'click button': 'button'
      },
      render: function() {
        var $wrapper, ContentView, HeaderView, contentView, headerView;
        console.log('render credit-cloud view...');
        $wrapper = $('.wrapper');
        this.$el.html(tpl);
        HeaderView = require('./s-header');
        headerView = new HeaderView({
          el: $("header.s-header")
        });
        ContentView = require('./cc-footer');
        contentView = new ContentView({
          el: $('footer.sub-footer')
        });
        this.$el.css({
          top: 0
        }).addClass('slideInUp');
        return setTimeout(function() {
          if ($wrapper.length > 1) {
            return $wrapper.get(0).remove();
          }
        }, 1010);
      },
      subHeader: function(e) {
        var $this, self, sub_view;
        self = this;
        $this = $(e.currentTarget);
        sub_view = $this.data('view');
        this.$el.find('.sub-header li').removeClass('active');
        $this.addClass('active');
        switch (sub_view) {
          case 'cc':
            return self.creditCloud();
          case 'products':
            return self.products();
          case 'customers':
            return self.customers();
        }
      },
      creditCloud: function() {
        return console.log('creditcloud');
      },
      products: function() {
        return console.log('products');
      },
      customers: function() {
        return console.log('customers');
      },
      button: function() {
        return alert(33333);
      }
    });
    return module.exports = ThisView;
  });

}).call(this);
