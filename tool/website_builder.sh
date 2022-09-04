#!/bin/bash
#path:/home/tool.sh
echo "hello tizania <3"
chmod +x website_builder.sh # make the file executable by the user running the script with admin privileges

cd ..
mkdir views
cd views
touch index.html
# echo "<!DOCTYPE html>
# <html lang="en">
cd ..
mkdir src 
cd src 
mkdir images
mkdir style
sleep 1
cd style 
touch style.css
# echo "body {background-color: #000000;}" >> style.css
touch style.scss
# echo "body {background-color: #000000;}" >> style.scss
cd ..
mkdir js
cd js
touch script.js
cd ..
# echo "console.log('Hello World');" >> script.js

$SHELL #prevent it from closing