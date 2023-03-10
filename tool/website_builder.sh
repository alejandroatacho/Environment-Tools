#!/bin/bash
#path:/home/tool.sh
echo "Making the files!"
chmod +x website_builder.sh # make the file executable by the user running the script with admin privileges

mkdir website_folder_rename_me
cd website_folder_rename_me
cat > index.html <<EOF
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    
</body>
</html>
EOF
# touch index.html
# printf "<!DOCTYPE html>
# <html lang="en">
# <head>
#     <meta charset="UTF-8">
#     <meta http-equiv="X-UA-Compatible" content="IE=edge">
#     <meta name="viewport" content="width=device-width, initial-scale=1.0">
#     <title>Document</title>
# </head>
# <body>
    
# </body>
# </html>" > index.html
mkdir views
cd views
touch about_me.html
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

# $SHELL #prevent it from closing
exit