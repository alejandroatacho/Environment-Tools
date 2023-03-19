#!/bin/bash
# Path: run.sh
echo "Hello, $(whoami) <3, $(hostname)"
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


SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

sh_files=(
  "tools/websites/website_builder.sh"
  "tools/scripts/auto_delete.sh"
  "tools/odoo/odoo_v14.sh"
  "tools/odoo/odoo_template.sh"
  "tools/scripts/support_me.sh"
  "tools/scripts/delete_sass.sh"
  "tools/scripts/code_counter.sh"
)

py_files=(
  "tools/scripts/hunt_my_xml_path.py"
  "tools/scripts/tree_viewer_xml.py"
)

options=("${sh_files[@]}" "${py_files[@]}" "Quit")

PS3='Please pick a script to run: '
select opt in "${options[@]}"
do
    if [ "$opt" = "Quit" ]; then
        break
    fi

    if [[ " ${sh_files[*]} " == *" ${opt} "* ]]; then
        "${SCRIPT_DIR}/${opt}"
        status=$?
    elif [[ " ${py_files[*]} " == *" ${opt} "* ]]; then
        python3 "${SCRIPT_DIR}/${opt}"
        status=$?
    else
        echo "Invalid option."
        continue
    fi

    if [ $status -eq 0 ]; then
        echo "${opt} completed successfully."
    else
        echo "${opt} failed."
    fi
done
