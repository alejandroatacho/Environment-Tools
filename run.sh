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
options=("Website Builder" "Add Investors" "Odoo Builder" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Website Builder")
            cd tool
            exec ./website_builder.sh
            ;;
        "Add Investors")
        read -r -p "Press any key to continue!: " response
        response=${response,,}    # tolower
            exec python execute.py
            ;;
        "Odoo Builder")
            cd tool
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