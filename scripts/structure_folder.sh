#!/bin/bash

# Path to the directory to be displayed
path="./"

# Name of the file to save the output to
file="folder_structure.txt"

# Delete the file if it already exists
if [ -f $file ]; then
  rm $file
fi

# Create the file and write the header
touch $file
echo "Folder structure of $path" >> $file
echo "=========================" >> $file

# Recursively list the files and folders and write them to the file
function list_files {
  for item in $1/*; do
    echo "$item" >> $file
    if [ -d $item ]; then
      echo "|-- $(basename $item)/" >> $file
      list_files $item
    else
      echo "|-- $(basename $item)" >> $file
    fi
  done
}

# Call the function with the specified path
list_files $path

# Print the message to confirm that the file has been created
echo "Folder structure printed to $file"
