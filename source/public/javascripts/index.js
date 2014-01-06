(function() {
  var arr, index, out, _i, _j, _len, _results;

  out = function(msg) {
    return alert(msg);
  };

  arr = (function() {
    _results = [];
    for (_i = 0; _i <= 100; _i++){ _results.push(_i); }
    return _results;
  }).apply(this);

  for (_j = 0, _len = arr.length; _j < _len; _j++) {
    index = arr[_j];
    console.log(index);
  }

}).call(this);
