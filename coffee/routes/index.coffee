
###
GET home page.
###
exports.index = (req, res) ->
    res.render "index",
        title: "init index page..."

