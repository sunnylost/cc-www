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
      showSubFooter: function() {
        return $('.sub-footer').css('visibility', 'visible');
      }
    };
  });

}).call(this);
