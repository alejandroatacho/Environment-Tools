#!/bin/bash
#path:/home/tool.sh
echo "hello tizania <3"
chmod +x website_builder.sh # make the file executable by the user running the script with admin privileges

cd ..
mkdir views
cd views
file_html() {
    html='<!DOCTYPE html> <html lang="en"> <head> <meta charset="UTF-8"> <meta name="viewport" content="width=device-width, initial-scale=1.0"> <meta http-equiv="X-UA-Compatible" content="ie=edge"> <title>Document</title> </head> <body> <h1>Hello World</h1> </body> </html>'
    touch index.html
    echo $html >> index.html
    $SHELL
    file=open('index.html','w')
    file.write(html)
    file.close()
    #$SHELL
}
file_html()

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