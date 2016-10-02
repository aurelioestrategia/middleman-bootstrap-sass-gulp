var gulp = require('gulp');
var concat = require('gulp-concat');
var uglify = require('gulp-uglify');
const image = require('gulp-image');


gulp.task('optimize', ['jsoptimize', 'imagesoptimize']);

gulp.task('jsoptimize', function() {
	return gulp.src(['source/js/vendor/_jquery-1.11.2.min.js','source/js/vendor/_bootstrap.js','source/js/vendor/_jquery.cookie.js','source/js/_vendor/jquery.cookiecuttr.js','source/js/_main.js'])
	.pipe(concat('all.min.js'))
	.pipe(uglify())
	.pipe(gulp.dest('source/js/'), { overwrite: true })
	.pipe(gulp.dest('build/js/'), { overwrite: true });
});

gulp.task('imagesoptimize', function () {
  gulp.src(['build/**/*.png', 'build/**/*.jpg', 'build/**/*.gif', 'build/**/*.jpeg'])
    .pipe(image({
      pngquant: true,
      optipng: false,
      zopflipng: true,
      jpegRecompress: false,
      jpegoptim: true,
      mozjpeg: true,
      gifsicle: true,
      svgo: true,
      concurrent: 10
    }))
    .pipe(gulp.dest('build'));
});


