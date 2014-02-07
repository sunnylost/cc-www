(function() {
  define(function(resource, exports, module) {
    var Funs;
    Funs = {
      imgLoader: function(url, callback) {
        var img;
        img = new Image();
        img.src = url;
        if (img.complete) {
          return callback(img);
        } else {
          img.onload = function() {
            callback(img);
            return img.onload = null;
          };
          return img.onerror = function(err) {
            return console.log('load img error:', img, err);
          };
        }
      }
    };
    return module.exports = Funs;
  });

}).call(this);
