#!/bin/bash

cd ..
total_scss_lines=0
total_css_lines=0
total_js_lines=0
total_html_lines=0
total_php_lines=0

for file in $(find . -type f \( -name "*.scss" -o -name "*.css" -o -name "*.js" -o -name "*.html" -o -name "*.php" \))
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
  esac
done

echo "Total SCSS lines: $total_scss_lines"
echo "Total CSS lines: $total_css_lines"
echo "Total JS lines: $total_js_lines"
echo "Total HTML lines: $total_html_lines"
echo "Total PHP lines: $total_php_lines"
