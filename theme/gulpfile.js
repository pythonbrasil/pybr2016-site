// Call Plugins
var gulp = require('gulp'),
  uglify = require('gulp-uglify'),
  concat = require('gulp-concat'),
  sass = require('gulp-sass');

// Call Uglify and Concat JS
gulp.task('js', function() {
  return gulp.src('js-src/**/*.js')
    .pipe(concat('main.js'))
    .pipe(uglify())
    .pipe(gulp.dest('static/js'));
});

// Call to Sass
gulp.task('sass', function() {
  return gulp.src('sass/main.scss')
    .pipe(sass({ errLogToConsole: true }))
    .pipe(gulp.dest('static/css'));
});

gulp.task('default', ['js', 'sass']);
