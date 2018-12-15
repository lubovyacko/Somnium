let gulp = require('gulp'),
sass = require('gulp-sass');

gulp.task('sass',()=>{
    return gulp.src('static/sass/main.sass').
    pipe(sass()).
    pipe(gulp.dest('static/css'))
});