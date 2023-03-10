if [ "$(uname)" == "Darwin" ]; then
  # macOS
  open "https://github.com/alejandroatacho"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  # Linux
  xdg-open "https://github.com/alejandroatacho"
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
  # Windows NT
  start "https://github.com/alejandroatacho"
else 
  echo "Your OS is not supported!"
  echo "so I forced it instead, hopefully it works!"
  sleep 3
  open "https://github.com/alejandroatacho"
  xdg-open "https://github.com/alejandroatacho"
  start "https://github.com/alejandroatacho"
 
fi
