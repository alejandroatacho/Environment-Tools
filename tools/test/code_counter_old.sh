#!/bin/bash

cd ..
#cd ..
total_scss_lines=0
total_css_lines=0
total_js_lines=0
total_html_lines=0
total_php_lines=0
total_py_lines=0
total_sh_lines=0
total_xml_lines=0
total_xslt_lines=0

for file in $(find . -type f \( -name "*.scss" -o -name "*.css" -o -name "*.js" -o -name "*.html" -o -name "*.php" -o -name "*.py" -o -name "*.sh" -o -name "*.xml" -o -name "*.xslt" \))
do
  lines=$(wc -l < "$file")

  case "$file" in
    *.scss)
      total_scss_lines=$((total_scss_lines + lines))
      ;;
    *.css)
      total_css_lines=$((total_css_lines + lines))
      ;;
    *.js)
      total_js_lines=$((total_js_lines + lines))
      ;;
    *.html)
      total_html_lines=$((total_html_lines + lines))
      ;;
    *.php)
      total_php_lines=$((total_php_lines + lines))
      ;;
    *.py)
      total_py_lines=$((total_py_lines + lines))
      ;;
    *.sh)
      total_sh_lines=$((total_sh_lines + lines))
      ;;
    *.xml)
      total_xml_lines=$((total_xml_lines + lines))
      ;;
    *.xslt)
      total_xslt_lines=$((total_xslt_lines + lines))
      ;;
  esac
done

output_file="code_line_count.txt"
#cd data
if [ -f $output_file ]; then
  rm $output_file
fi

touch $output_file

if [ $total_scss_lines -ne 0 ]; then
  echo "Total SCSS lines: $total_scss_lines" >> $output_file
fi

if [ $total_css_lines -ne 0 ]; then
  echo "Total CSS lines: $total_css_lines" >> $output_file
fi

if [ $total_js_lines -ne 0 ]; then
  echo "Total JS lines: $total_js_lines" >> $output_file
fi

if [ $total_html_lines -ne 0 ]; then
  echo "Total HTML lines: $total_html_lines" >> $output_file
fi

if [ $total_php_lines -ne 0 ]; then
  echo "Total PHP lines: $total_php_lines" >> $output_file
fi

if [ $total_py_lines -ne 0 ]; then
  echo "Total PY lines: $total_py_lines" >> $output_file
fi

if [ $total_sh_lines -ne 0 ]; then
  echo "Total SH lines: $total_sh_lines" >> $output_file
fi

if [ $total_xml_lines -ne 0 ]; then
   echo "Total XML lines: $total_sh_lines" >> $output_file
if [ $total_xslt_lines -ne 0 ]; then
echo "Total XSLT lines: $total_xslt_lines" >> $output_file
fi

echo "Line count written to $output_file"
sleep 5