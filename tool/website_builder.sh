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
    <link rel="stylesheet" href="src/style/style.css" type="text/css">
    <title>website_name</title>
</head>
<body>

<div class="container" style="justify-content:center;text-align:center;color:black;">
    <p> Hello front page with nothing on it <3
    </p>
    <div>
        <button onclick="showAlert()">Show Alert </button>

    </div>

</div>

 <script src="src/js/script.js" type="text/javascript"></script>  
</body>

</html>
EOF
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
cat > style.css <<EOF
.container {
    display: flex;
    flex-direction: column;
    height: 100vh;
}

button {
    background-color: blue;
    color: white;
    padding: 10px 20px;
    border-radius: 5px;
    cursor: pointer;
    margin-top: 20px;
}
EOF
cd ..
mkdir js
cd js
cat > script.js << EOF
function showAlert() {
    alert("This is an alert message!");
}
EOF
cd ..

mkdir script

# echo "console.log('Hello World');" >> script.js

# $SHELL #prevent it from closing
exit