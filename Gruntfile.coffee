module.exports = (grunt) ->

  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    coffee:
      default:
        files: 'dist/<%= pkg.name %>.js': ['src/<%= pkg.name %>.coffee']
      demo:
        files: 'demo/assets/js/demo.js': ['demo/assets/coffee/demo.coffee']

    copy:
      release:
        files: [
          { src: 'dist/<%= pkg.name %>.js', dest: 'demo/assets/js/<%= pkg.name %>.js' }
          { expand: true, flatten: true, src: 'dist/**/*.js', dest: '.' }
        ]

    sass:
      demo:
        options:
          style: 'compressed'
          sourcemap: 'none'
        files: 'demo/assets/css/demo.css': 'demo/assets/scss/demo.scss'

    uglify:
      min:
        files: 'dist/<%= pkg.name %>.min.js': ['dist/<%= pkg.name %>.js']
      beautify:
        options:
          compress: false
          beautify: true
        files: 'dist/<%= pkg.name %>.js': ['dist/<%= pkg.name %>.js']

    watch:
      default:
        files: ['src/<%= pkg.name %>.coffee']
        tasks: ['default']
      demo:
        files: ['demo/assets/scss/**/*.scss', 'demo/assets/coffee/**/*.coffee']
        tasks: ['sass:demo', 'coffee:demo']

    coffeelint:
      default: ['src/*.coffee']

  # These plugins provide necessary tasks.
  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-jsbeautifier'
  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-contrib-copy'

  # Default task.
  grunt.registerTask 'default', ['coffeelint', 'coffee:default', 'uglify']
  grunt.registerTask 'release', ['default', 'copy:release']