#!/bin/bash

# ├──

# ├─┬

# └──

clear

echo "Generating html project..."

(~/scripts/generators/static_html.sh) &

echo "Structure:
├── gulpfile.js
├── index.html
├── package.json
├─┬ assets
| ├─┬ dist
| | ├── css
| | └── js
| ├── ico
| ├── img
| ├─┬ js
| | ├── modules
| | └── globals.js
| ├─┬ scss
| | ├─┬ config
| | | └── reset.scss
| | ├── modules
| | └── styles.scss
"

while true; do
    read -p "Scaffolding done...do you want to npm install (y/n)?" yn
    case $yn in
        [Yy]* ) npm install --save gulp gulp-clean-css gulp-clean-css gulp-concat gulp-minify gulp-rename gulp-sass gulp-sourcemaps gulp-uglify; break;;
        [Nn]* ) break;;
        * ) echo "";;
    esac
done

echo "SUCCESS! It looks like we're all done here. Happy coding :)"
