define (resource, exports, module) ->
  
  Funs =
    imgLoader: (url, callback) ->
      #console.log 'loading', url
      img = new Image()
      img.src = url

      if img.complete
        #callback(img.width, img.height)
        callback(img)
      else
        img.onload = ->
          #if img.complete
          callback(img)
          img.onload = null

        img.onerror = (err)->
          console.log 'load img error:', img, err

  module.exports = Funs
