var gulp = require('gulp');
var gutil = require('gulp-util');
var bower = require('bower');
var concat = require('gulp-concat');
var rename = require('gulp-rename');
var watch = require('gulp-watch');
var batch = require('gulp-batch');
var uglify = require('gulp-uglify');

var jsFiles='js/**/*.js'

//压缩,合并 js
gulp.task('minifyjs', function () {
  return gulp.src(jsFiles)      //需要操作的文件
    .pipe(concat('app.js'))    //合并所有js到main.js
    .pipe(gulp.dest('dist/js'))       //输出到文件夹
    .pipe(rename({suffix: '.min'}))   //rename压缩后的文件名
    .pipe(uglify())    //压缩
    .pipe(gulp.dest('dist/js'));  //输出
});

gulp.task('build', function () { gulp.start('minifyjs') });

gulp.task('watch', function () {
  watch(jsFiles, batch(function (events, done) {
    gulp.start('build', done);
  }));
});

//默认命令，在cmd中输入gulp后，执行的就是这个任务(压缩js需要在检查js之后操作)
gulp.task('default', [], function () {
  gulp.start('minifyjs');
  gulp.start('watch');
});
