#!/bin/bash
# Path: run.sh
echo "Hello <3"
sleep 1
echo "
ℊ☈ℇℊ
┊┊┊┊╭━━╮╭━━╮┊╭━┓
┈╭━━┫▔╲┣╯━━┻╮┃╭┛♫
╭┫┈┈┃┈┈▏┊▋┊▋┃┃┃
┃┃┈┈┃┈╱╭╰╯╰╯╰┫┣━╮
╯┃┈┈╰━━╯╰━━━┳┫┣╮┃
┈┃╭┳╭━┫╭┳╭━━╯┃┃┃┃
┈┃┃┃┃┈┃┃┃┃┈╭╮┃╰╯┃
┈┗┛┗┛┈┗┛┗┛╭╮┈╰━━╯
"

PS3='Please pick your environment builder!: '
options=("Website Builder" "Odoo Builder" "Delete Folder" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Website Builder")
            cd tools
            exec ./website_builder.sh
            sleep 1
            open website_folder_rename_me/
            ;;
        "Delete Folder")
            cd tools
            exec ./auto_delete.sh
            ;;
        "Odoo Builder")
            cd tools
            exec ./odoo_run.sh
            cd ..
            #echo $opt
            # echo "you chose choice $REPLY which is $opt"
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done