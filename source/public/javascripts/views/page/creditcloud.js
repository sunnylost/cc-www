(function() {
  define(function(require, exports, module) {
    var $, Backbone, ThisView, Util, common, tpl, _;
    $ = require('jquery');
    Backbone = require('backbone');
    _ = require('underscore');
    Util = require('../../common/util');
    common = require('../common');
    tpl = require('../../../tpl/page.tpl');
    ThisView = Backbone.View.extend({
      initialize: function() {
        this.$el.addClass('view-cc-wp animated slow');
        this.common = common;
        return this.render();
      },
      events: {
        'click button': 'button'
      },
      render: function() {
        var $wrapper, ContainerView, HeaderView, SubHeaderView, containerView, headerView, self, subHeaderView;
        self = this;
        $wrapper = $('.wrapper');
        this.$el.html(tpl);
        HeaderView = require('../header/s-header');
        headerView = new HeaderView({
          el: $("header.s-header")
        });
        SubHeaderView = require('../header/sub-header');
        subHeaderView = new SubHeaderView({
          el: $('.sub-header')
        });
        this.$el.find('li[data-view=cc]').addClass('active');
        ContainerView = require('../content/cc-about');
        containerView = new ContainerView({
          el: $('.sub-section .container-in')
        });
        setTimeout(function() {
          var CcFooterView, ccFooterView;
          CcFooterView = require('../footer/cc-footer');
          ccFooterView = new CcFooterView({
            el: $('.sub-footer')
          });
          return self.common.resetContainer();
        }, 300);
        this.$el.css({
          top: 0
        }).addClass('slideInUp');
        return setTimeout(function() {
          if ($wrapper.length > 1) {
            return $wrapper.get(0).remove();
          }
        }, 1010);
      },
      button: function() {
        return alert(33333);
      }
    });
    return module.exports = ThisView;
  });

}).call(this);
