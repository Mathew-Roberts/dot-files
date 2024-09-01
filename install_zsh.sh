#!/bin/zsh

# Function to check if a file or folder exists, handle replacement, and create a symlink
symlink_item() {
    local source=$1
    local target=$2

    if [ -e "$target" ]; then
        echo "$target already exists."
        echo "Do you want to replace it? (y/n): " 
        read choice
        if [ "$choice" = "y" ]; then
            rm -rf "$target"
            echo "$target will be replaced."
            echo "Symlinking ${source} to ${target}"
            ln -s "$source" "$target"
        else
            echo "Skipped $target."
        fi
    else
        echo "Symlinking ${source} to ${target}"
        ln -s "$source" "$target"
    fi
}

current_dir=$(pwd)
config_folders=("nvim")
config_files=(".tmux.conf" ".zshrc")
base_config_dir="${HOME}/.config"
dot_files_dir="${HOME}/dot-files"
base_file_dir="${HOME}"

cd ${HOME}

# Symlink .config/ folders
echo "\nSymlinking .config/ folders ..."
for folder in "${config_folders[@]}"; do
    src="${dot_files_dir}/.config/${folder}"
    target="${base_config_dir}/${folder}"
    symlink_item "$src" "$target"
done

# Symlink config files
echo "\nSymlinking config files ..."
for file in "${config_files[@]}"; do
    src="${dot_files_dir}/${file}"
    target="${base_file_dir}/${file}"
    symlink_item "$src" "$target"
done

echo "Install Complete"
cd "$current_dir"

