# Create a new directory and enter it
mc () {
  if [ $# -ne 1 ]; then
    echo 'usage: mc <dir-name>'
    return 137
  fi
  local dir_name="$1"
  mkdir -p "$dir_name" && cd "$dir_name"
}
