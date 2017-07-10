#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo -e "\e[31mERROR: This script must be run as root \e[39m" 1>&2
   exit 1
fi
echo "----------------------------------------------------------------------------------"
echo -e "\e[32m\t\t\tInstalling CUDA\e[0m"
echo "----------------------------------------------------------------------------------"
echo -e "\e[31m\e[4mNote: This process takes time.\e[0m"
if [ ! -f cuda-repo-ubuntu1404-8-0-local_8.0.44-1_amd64.deb ]; then
    echo -e "\e[32mDownloading CUDA deb file.\e[0m"
    wget https://developer.nvidia.com/compute/cuda/8.0/prod/local_installers/cuda-repo-ubuntu1404-8-0-local_8.0.44-1_amd64-deb
    mv cuda-repo-ubuntu1404-8-0-local_8.0.44-1_amd64-deb cuda-repo-ubuntu1404-8-0-local_8.0.44-1_amd64.deb
fi
sudo dpkg -i cuda-repo-ubuntu1404-8-0-local_8.0.44-1_amd64.deb
sudo apt-get update
sudo apt-get install cuda
echo -e "\e92mCUDA Installation completed"
echo "----------------------------------------------------------------------------------"
echo 
echo "----------------------------------------------------------------------------------"
echo -e "\e[32m\t\t\tInstalling CUDNN\e[97m"
echo "----------------------------------------------------------------------------------"
if [ ! -f cudnn-8.0-linux-x64-v5.1.tgz ];then
    echo "Downloading CUDNN V-5.1 archive"
    wget https://developer.nvidia.com/compute/machine-learning/cudnn/secure/v5.1/prod/8.0/cudnn-8.0-linux-x64-v5.1-tgz
fi
tar -xvzf cudnn-8.0-linux-x64-v5.1.tgz 
cd cuda
sudo cp ./include/cudnn.h /usr/local/cuda-8.0/include/
sudo cp ./lib64/lib* /usr/local/cuda-8.0/lib64/
cd ../
rm -rf cuda/
echo -e "\e[92mCUDNN files moved\e[97m"
echo "----------------------------------------------------------------------------------"

mkdir cuda_source_files
mv cuda-repo-ubuntu1404-8-0-local_8.0.44-1_amd64.deb cuda_source_files
mv cudnn-8.0-linux-x64-v5.1.tgz  cuda_source_files

