
###
GET users listing.
###
exports.list = (req, res) ->
  res.render 'index',
    title: '### users page'
