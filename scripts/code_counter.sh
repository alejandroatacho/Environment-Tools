#!/bin/bash

cd ..
total_lines=0
for file in $(find . -type f -name "*.scss")
do
  lines=$(wc -l < "$file")
  total_lines=$((total_lines + lines))
done
echo "Total SCSS lines: $total_lines"
