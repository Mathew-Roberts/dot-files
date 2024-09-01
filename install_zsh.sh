#!/bin/zsh

current_dir=$(pwd)
# Add new config folder here
config_folders=("nvim")
base_config_dir="${HOME}/.config"
dot_files_dir="${HOME}/dot-files"

cd ${HOME}
echo "\nSymlinking .config/ folders ..."
for folder in "${config_folders[@]}"; do
    dot_files_folder="${dot_files_dir}/.config/${folder}"
    base_config_dir_folder="${base_config_dir}/${folder}"
    if [ -e "$base_config_dir_folder" ]; then
        echo "$base_config_dir_folder already exists."
        echo "Do you want to replace it? (y/n): " 
        read choice
        if [ "$choice" = "y" ]; then
            rm -rf "$base_config_dir_folder"
            echo "$base_config_dir_folder will be replaced."
            echo "Symlinking ${dot_files_folder} to ${base_config_dir_folder}"
            ln -s ${dot_files_folder} ${base_config_dir_folder}
        else
            echo "Skipped $base_config_dir."
        fi
    else
        echo "Symlinking ${dot_files_folder} to ${base_config_dir_folder}"
        ln -s ${dot_files_folder} ${base_config_dir_folder}
    fi
done

# Add new config files
config_files=(".tmux.conf")
base_file_dir="${HOME}"

cd ${HOME}
echo "\nSymlinking config files ..."
for file in "${config_files[@]}"; do
    dot_files_file="${dot_files_dir}/${file}"
    base_file_dir_file="${base_file_dir}/${file}"
    if [ -e "$base_file_dir_file" ]; then
        echo "$base_file_dir_file exists."
        echo "Do you want to replace it? (y/n): " 
        read choice
        if [ "$choice" = "y" ]; then
            rm -rf "$base_file_dir_file"
            echo "$base_file_dir_file will be replaced."
            echo "Symlinking ${dot_files_file} to ${base_file_dir_file}"
            ln -s ${dot_files_file} ${base_file_dir_file}
        else
            echo "Skipped $base_file_dir_file."
        fi
    else
        echo "Symlinking ${dot_files_file} to ${base_file_dir_file}"
        ln -s ${dot_files_file} ${base_file_dir_file}
    fi
done

echo "Install Complete"
cd $current_dir
