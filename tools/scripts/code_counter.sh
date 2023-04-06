#!/bin/bash


# Initialize associative array for file extensions and line counts
declare -A line_counts=( ["scss"]=0 ["css"]=0 ["js"]=0 ["html"]=0 ["php"]=0 ["py"]=0 ["sh"]=0 ["xml"]=0 ["xslt"]=0 )

# Search for files and count lines
while IFS= read -r -d '' file; do
  extension="${file##*.}"
  lines=$(wc -l < "$file")
  line_counts["$extension"]=$((line_counts["$extension"] + lines))
done < <(find . -type f \( -name "*.scss" -o -name "*.css" -o -name "*.js" -o -name "*.html" -o -name "*.php" -o -name "*.py" -o -name "*.sh" -o -name "*.xml" -o -name "*.xslt" \) -print0)

output_file="code_line_count.txt"
cd tools/data

# Remove the output file if it exists
[ -f "$output_file" ] && rm "$output_file"

# Write line counts to the output file
for ext in "${!line_counts[@]}"; do
  count=${line_counts["$ext"]}
  [ $count -ne 0 ] && echo "Total ${ext^^} lines: $count" >> "$output_file"
done

echo "Line count written to $output_file"
sleep 5
