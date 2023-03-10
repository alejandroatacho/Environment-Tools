#!/bin/bash
#path:/home/tool.sh
echo "Making the files!"
chmod +x website_builder.sh # make the file executable by the user running the script with admin privileges

mkdir website_folder_rename_me
cd website_folder_rename_me
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
touch style.{css,scss}
printf "body {\n    background-color: #000000;\n}\n" > style.css
printf "body {\n    background-color: #000000;\n}\n" > style.scss
cd ..
mkdir js
cd js
touch script.js
cd ..
mkdir script
# echo "console.log('Hello World');" >> script.js

$SHELL #prevent it from closing