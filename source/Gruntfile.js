(function() {
  module.exports = function(grunt) {
    grunt.initConfig({
      pkg: grunt.file.readJSON("package.json"),
      coffee: {
        options: {
          sourceMap: false,
          sourceMapDir: "public/maps/js/"
        },
        compile: {
          expand: true,
          cwd: "public/coffee",
          src: ["**/*.coffee", "!**/debug-*.coffee"],
          dest: "public/javascripts/",
          ext: ".js"
        }
      },

      imagemin: {
        png: {
          options: {
            optimizationLevel: 7
          },
          files: [
            {
              // Set to true to enable the following options…
              expand: true,
              // cwd is 'current working directory'
              cwd: 'public/source-imgs',
              src: [ '*.png', '**/*.png' ],
              // Could also match cwd line above. i.e. project-directory/img/
              dest: 'public/images',
              ext: '.png'
            }
          ]
        },
        jpg: {
          options: {
            progressive: true
          },
          files: [
            {
              // Set to true to enable the following options…
              expand: true,
              // cwd is 'current working directory'
              cwd: 'public/source-imgs',
              src: [ '*.jpg', '**/*.jpg' ],
              // Could also match cwd. i.e. project-directory/img/
              dest: 'public/images',
              ext: '.jpg'
            }
          ]
        }
      },

      watch: {
        files: ["public/coffee/**/*.coffee"],
        tasks: ["coffee"]
      }
    });
    grunt.loadNpmTasks("grunt-contrib-less");
    grunt.loadNpmTasks("grunt-contrib-coffee");
    grunt.loadNpmTasks("grunt-contrib-watch");
    grunt.loadNpmTasks("grunt-contrib-imagemin");
    return grunt.registerTask("default", "imagemin");
  };

}).call(this);
