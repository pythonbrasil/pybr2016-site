// Call Plugins
var gulp    = require('gulp'),
    uglify  = require('gulp-uglify'),
    concat  = require('gulp-concat');

// Call Uglify and Concat JS
gulp.task('js', function(){
    return gulp.src('js-src/**/*.js')
        .pipe(concat('main.js'))
        .pipe(uglify())
        .pipe(gulp.dest('js/'));
});

gulp.task('default', ['js']);