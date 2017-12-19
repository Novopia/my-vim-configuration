#!/usr/bin/env sh

set -e

# $0 is the name of the bash script.
current_dir=$(pwd $0)

files=$(find . -maxdepth 1 -not -name 'README.md' -not -name '.*' -not -name 'setup.sh')

for file in $files; do
  prev_dotfile_path=$(echo $file | sed "s|^./|$HOME/.|")
  new_dotfile_path=$(echo $file | sed "s|^./|$current_dir/|")

  if [[ -a $prev_dotfile_path ]]; then
    echo "Removing existing $prev_dotfile_path"
    rm -rf "$prev_dotfile_path"
  fi

  echo "SymLinking $new_dotfile_path ---> $prev_dotfile_path"
  ln -s "$new_dotfile_path" "$prev_dotfile_path"
done
