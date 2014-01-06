
###
Module dependencies.
App Interface
###

express = require("express")
routes = require("./routes")
user = require("./routes/user")
search = require("./routes/search")
http = require("http")
path = require("path")
app = express()

# all environments
app.set "port", process.env.PORT or 3000
app.set "views", path.join(__dirname, "views")
app.set "view engine", "jade"
app.use express.favicon()
app.use express.logger("dev")
app.use express.json()
app.use express.urlencoded()
app.use express.methodOverride()
app.use app.router
app.use(
  require("less-middleware")(
    #src: path.join(__dirname, "public")
    src: path.join(__dirname, "public/less")
    dest: path.join(__dirname, "public/stylesheets")
    prefix: '/stylesheets'
    compress: false
  )
)
app.use express.static(path.join(__dirname, "public"))

# development only
app.use express.errorHandler()  if "development" is app.get("env")

# 首页
app.get "/", routes.index

# users
app.get "/users", user.list

# search
app.get "/search", search.index
http.createServer(app).listen app.get("port"), ->
  console.log "Express server listening on port " + app.get("port")

