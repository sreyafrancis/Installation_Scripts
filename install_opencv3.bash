#! /bin/bash

echo "Installing Dependencies"
sudo apt-get install -y build-essential cmake pkg-config


sudo apt-get install -y libjpeg8-dev libtiff5-dev libjasper-dev libpng12-dev


sudo apt-get install -y libavcodec-dev libavformat-dev libswscale-dev libv4l-dev
sudo apt-get install -y libxvidcore-dev libx264-dev

sudo apt-get install -y libgtk-3-dev

sudo apt-get install -y qt5-default qttools5-dev-tools

sudo apt-get install -y libatlas-base-dev gfortran
sudo apt-get install -y python2.7-dev python3-dev
echo "Installed Dependencies"


echo "Copying OpenCV3 Files "
cp -r ~/OPENCV/opencv ~
cp -r ~/OPENCV/opencv_contrib ~
echo "Copying Done "

cd ~/opencv
git checkout 3.2.0

cd ~/opencv_contrib
git checkout 3.2.0

echo "Installing....."
cd ~/opencv
pwd
echo "Removing Release File"
#rm -rf release
rm -rf build
mkdir build
cd build

#cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules -D BUILD_EXAMPLES=ON -D WITH_QT=ON -D WITH_OPENGL=ON -D INSTALL_PYTHON_EXAMPLES=ON ..
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules -D PYTHON3_LIBRARY=/usr/lib/python3.5 -D PYTHON3_INCLUDE_DIR=/usr/include/python3.5 -D PYTHON3_EXECUTABLE=/usr/bin/python3 -D BUILD_opencv_python2=OFF -D BUILD_opencv_python3=ON -D INSTALL_PYTHON_EXAMPLES=ON D INSTALL_C_EXAMPLES=OFF -D BUILD_EXAMPLES=ON -D WITH_QT=ON -D WITH_OPENGL=ON ..
make -j4

sudo make install
sudo ldconfig
