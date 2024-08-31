#!/bin/bash

current_dir=$(pwd)
# Add new config folder here
config_folders=("nvim")
base_config_dir="${HOME}/.config"
dot_files_dir="${HOME}/dot-files"

cd ${HOME}
echo "Symlinking .config/ folders ..."
for folder in "${config_folders[@]}"; do
    dot_files_folder="${dot_files_dir}/.config/${folder}"
    base_config_dir_folder="${base_config_dir}/${folder}"

    echo "Symlinking ${dot_files_folder} to ${base_config_dir_folder}"
    ln -s ${dot_files_folder} ${base_config_dir_folder}
done


# Add new config files
config_files=(".tmux.conf")
base_file_dir="${HOME}"

cd ${HOME}
echo "Symlinking config files ..."
for file in "${config_files[@]}"; do
    dot_files_file="${dot_files_dir}/${file}"
    base_file_dir_file="${base_file_dir}/${file}"

    echo "Symlinking ${dot_files_file} to ${base_file_dir_file}"
    ln -s ${dot_files_file} ${base_file_dir_file}
done

echo "Install Complete"
cd $current_dir
