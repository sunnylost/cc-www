(function() {
  define(function(require) {
    var App;
    window.CC = {};
    CC.funs = require('../common/globalFuns');
    App = require('../views/main');
    return new App;
  });

}).call(this);
