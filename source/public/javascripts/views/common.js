(function() {
  define(function(require, exports, module) {
    var $;
    $ = require('jquery');
    return module.exports = {
      resetContainer: function($container) {
        var h_header, h_subFooter, h_subHeader, reset_height;
        h_header = $('.s-header').height();
        h_subHeader = $('.sub-header').height();
        h_subFooter = $('.sub-footer').height();
        reset_height = $(window).height() - (h_header + h_subHeader + h_subFooter);
        return $('.container-in').height(reset_height);
      },
      createHeader: function(el, callback) {
        var HeaderView, View, html;
        HeaderView = require('./header');
        if ($.isFunction(el)) {
          callback = el;
          el = $('.wrapper');
        } else {
          el = el || $('.wrapper');
        }
        html = "<header class=\"header\" id=\"header\"></header>";
        el.append(html);
        View = new HeaderView({
          el: $(".header")
        });
        if (callback) {
          return callback(View);
        }
      },
      createContainer: function(el, callback) {
        var ContainerView, View, html;
        ContainerView = require('./container');
        if ($.isFunction(el)) {
          callback = el;
          el = $('.wrapper');
        } else {
          el = el || $('.wrapper');
        }
        html = "<div class=\"container\" id=\"home-container\"></div>";
        el.append(html);
        View = new ContainerView({
          el: $(".container")
        });
        if (callback) {
          return callback(View);
        }
      },
      createFooter: function(el, callback) {
        var FooterView, View, cl, html;
        FooterView = require('./footer');
        if ($.isFunction(el)) {
          callback = el;
          cl = $('.wrapper');
        } else {
          el = el || $('.wrapper');
        }
        html = "<footer class=\"footer\" id=\"footer\"></footer>";
        el.append(html);
        View = new FooterView({
          el: $(".footer")
        });
        if (callback) {
          return callback(View);
        }
      },
      createCreditCloud: function(el, callback) {
        var CcView, View, html;
        CcView = require('./creditcloud');
        if ($.isFunction(el)) {
          callback = el;
          el = $('.wrapper');
        } else {
          el = el || $('.wrapper');
        }
        html = "<div class=\"container\"></div>";
        el.append(html);
        View = new CcView({
          el: $('.wrapper')
        });
        if (callback) {
          return callback(View);
        }
      }
    };
  });

}).call(this);
