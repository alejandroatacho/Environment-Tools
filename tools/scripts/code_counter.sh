#!/bin/bash

# Initialize associative arrays for file extensions, line counts, and file sizes
declare -A line_counts=( ["scss"]=0 ["css"]=0 ["js"]=0 ["html"]=0 ["php"]=0 ["py"]=0 ["sh"]=0 ["xml"]=0 ["xslt"]=0 ["java"]=0 ["c"]=0 ["cpp"]=0 ["cs"]=0 ["go"]=0 ["rb"]=0 ["lua"]=0 ["swift"]=0 ["kt"]=0 ["rs"]=0 ["pl"]=0 ["r"]=0 ["sql"]=0 ["yml"]=0 ["json"]=0 ["md"]=0 ["txt"]=0 )
declare -A file_sizes=( ["scss"]=0 ["css"]=0 ["js"]=0 ["html"]=0 ["php"]=0 ["py"]=0 ["sh"]=0 ["xml"]=0 ["xslt"]=0 ["java"]=0 ["c"]=0 ["cpp"]=0 ["cs"]=0 ["go"]=0 ["rb"]=0 ["lua"]=0 ["swift"]=0 ["kt"]=0 ["rs"]=0 ["pl"]=0 ["r"]=0 ["sql"]=0 ["yml"]=0 ["json"]=0 ["md"]=0 ["txt"]=0 )

# Search for files and count lines, file sizes
while IFS= read -r -d '' file; do
  extension="${file##*.}"
  lines=$(wc -l < "$file")
  size=$(du -k "$file" | cut -f1)
  line_counts["$extension"]=$((line_counts["$extension"] + lines))
  file_sizes["$extension"]=$((file_sizes["$extension"] + size))
done < <(find . -type f \( -name "*.scss" -o -name "*.css" -o -name "*.js" -o -name "*.html" -o -name "*.php" -o -name "*.py" -o -name "*.sh" -o -name "*.xml" -o -name "*.xslt" -o -name "*.java" -o -name "*.c" -o -name "*.cpp" -o -name "*.cs" -o -name "*.go" -o -name "*.rb" -o -name "*.lua" -o -name "*.swift" -o -name "*.kt" -o -name "*.rs" -o -name "*.pl" -o -name "*.r" -o -name "*.sql" -o -name "*.yml" -o -name "*.json" -o -name "*.md" -o -name "*.txt" \) -print0)
output_file="code_line_count.txt"
cd tools/data

# Remove the output file if it exists
[ -f "$output_file" ] && rm "$output_file"

# Write line counts and file sizes to the output file
echo "All code lines in your project:" >> "$output_file"
echo >> "$output_file"

for ext in "${!line_counts[@]}"; do
  count=${line_counts["$ext"]}
  [ $count -ne 0 ] && echo "Total ${ext^^} lines: $count" >> "$output_file"
done

echo >> "$output_file"
echo "All code sizes in your project" >> "$output_file"
echo >> "$output_file"

for ext in "${!file_sizes[@]}"; do
  size=${file_sizes["$ext"]}
  [ $size -ne 0 ] && echo "Total ${ext^^} size: ${size}KB" >> "$output_file"
done

echo "Line count and file sizes written to $output_file"
sleep 1
