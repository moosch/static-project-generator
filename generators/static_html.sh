#!/bin/bash

# Generate index.html template
cat > index.html << _EOF_
<!doctype html>
<!-- paulirish.com/2008/conditional-stylesheets-vs-css-hacks-answer-neither/ -->
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!-- Consider adding a manifest.appcache: h5bp.com/d/Offline -->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width">

	<meta name="keywords" content="">
	<meta name="description" content="">

	<link rel="fluid-icon" href="assets/ico/fluidicon.png">

	<link rel="shortcut icon" href="assets/ico/favicon.png">
	<link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
	<link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
	<link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
	<link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">

	<link rel="icon" type="image/x-icon" href="assets/ico/favicon.ico">

	<link href='assets/dist/css/styles.min.css' rel='stylesheet' type='text/css'>

	<link rel="canonical" href="" />
	<meta property="og:locale" content="en_US" />
	<meta property="og:type" content="website" />
	<meta property="og:title" content="" />
	<meta property="og:description" content="" />
	<meta property="og:url" content="" />
	<meta property="og:site_name" content="" />
	<script type="application/ld+json">
	{
		"@context": "http://schema.org",
		"@type": "Organization",
		"url": "",
		"logo": "",
		"sameAs" : [
			"https://www.facebook.com/__",
			"https://twitter.com/__",
			"https://plus.google.com/__",
			"https://www.linkedin.com/company/__"
		]
	}
	</script>
</head>
<body>

	<script src="assets/dist/js/scripts-debug.js"></script>

</body>
</html>
_EOF_

# Generate gulpfile.js
cat > gulpfile.js << _EOF_
var gulp = require('gulp');
var sass = require('gulp-sass');
var sourcemaps = require('gulp-sourcemaps');
var concat = require('gulp-concat');
var cleanCSS = require('gulp-clean-css');
var rename = require('gulp-rename');
var minify = require('gulp-minify');

gulp.task('sass', function () {
	gulp.src( 'assets/scss/styles.scss' )
		.pipe(sourcemaps.init())
		.pipe(sass().on('error', function(error){
			console.log(error);
		}))
		.pipe(sourcemaps.write('map'))
		.pipe(rename('styles.css'))
		.pipe(gulp.dest('./assets/dist/css'))
		.pipe(cleanCSS({compatibility: 'ie8'}))
		.pipe(sourcemaps.write('map'))
		.pipe(rename('styles.min.css'))
		.pipe(gulp.dest('./assets/dist/css'));
});

gulp.task('js', function(){
	return gulp.src([
			'assets/js/*.js',
			'assets/js/*/*.js'
		])
		.pipe(concat('scripts.js'))
		.pipe(minify({
			 ext:{
				src:'-debug.js',
				min:'.js'
			},
		}))
		.pipe(gulp.dest('./assets/dist/js/'));
});

// Watch Our Files
gulp.task('watch', function() {
	gulp.watch([
		'assets/scss/*.scss',
		'assets/scss/*/*.scss',
		'assets/js/*/*.js',
		'assets/js/*.js',
	], ['sass', 'js']);
});

// Default
gulp.task('default', ['sass', 'js', 'watch']);
_EOF_



# Create file structure
mkdir assets
mkdir assets/img
mkdir assets/ico
mkdir assets/dist
mkdir assets/dist/css
mkdir assets/dist/js
mkdir assets/js
mkdir assets/js/modules
mkdir assets/scss
mkdir assets/scss/config
mkdir assets/scss/modules


# Generate styles.scss
cat > assets/scss/styles.scss << _EOF_
@charset 'UTF-8';

@import 'config/reset';
_EOF_

# Generate reset.scss
cat > assets/scss/config/reset.scss << _EOF_
html {
	box-sizing: border-box;
	-ms-text-size-adjust: 100%;
	-webkit-text-size-adjust: 100%;
}
*,
*::before,
*::after {
	box-sizing: inherit;
}
body {
	margin: 0;
}
section, main, aricle, figure, figcaption, header, footer {
	display:block;
}
_EOF_

# Generate scripts.js
cat > assets/js/globals.js << _EOF_
/*
 * AppName v0.0.1
 *
 * Author: 
 *
 * Licensed GPLv3 for open source use
 *
 * http://example.com
 * Copyright 2017 AppName
 */
+(function( win, doc ){
	"use strict";

})( window, document );
_EOF_

# Generate package.json
cat > package.json << _EOF_
{
  "name": "",
  "version": "0.0.1",
  "description": "",
  "main": "",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "author": "",
  "license": "ISC",
  "dependencies": {},
  "keywords": []
}
_EOF_


# install node modules
# npm install --save gulp gulp-clean-css gulp-concat gulp-minify gulp-rename gulp-sass gulp-sourcemaps gulp-uglify
