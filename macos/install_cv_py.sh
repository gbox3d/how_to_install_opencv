
#!/usr/bin/env bash

cwd=$(pwd)
cvVersion="master"

# Clean build directories
rm -rf opencv/build
rm -rf opencv_contrib/build
 
# Create directory for installation
mkdir installation
mkdir installation/OpenCV-"$cvVersion"

############ For Python 3 ############
# create virtual environment
mkvirtualenv OpenCV-"$cvVersion"-py3 -p python3
workon OpenCV-"$cvVersion"-py3
  
# now install python libraries within this virtual environment
pip install cmake numpy scipy matplotlib scikit-image scikit-learn ipython dlib
  
# quit virtual environment
deactivate
######################################

### 최신버전 opencv 받기 
git clone https://github.com/opencv/opencv.git
cd opencv
git checkout master
cd ..
  
git clone https://github.com/opencv/opencv_contrib.git
cd opencv_contrib
git checkout master
cd ..
 
cd opencv
mkdir build
cd build

## build
cmake -D CMAKE_BUILD_TYPE=RELEASE \
            -D CMAKE_INSTALL_PREFIX=$cwd/installation/OpenCV-"$cvVersion" \
            -D INSTALL_C_EXAMPLES=ON \
            -D INSTALL_PYTHON_EXAMPLES=ON \
            -D WITH_TBB=ON \
            -D WITH_V4L=ON \
            -D OPENCV_SKIP_PYTHON_LOADER=ON \
            -D CMAKE_PREFIX_PATH=$QT5PATH \
            -D CMAKE_MODULE_PATH="$QT5PATH"/lib/cmake \
            -D OPENCV_PYTHON3_INSTALL_PATH=~/.virtualenvs/OpenCV-"$cvVersion"-py3/lib/python3.7/site-packages \
        -D WITH_QT=ON \
        -D WITH_OPENGL=ON \
        -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules \
        -D BUILD_EXAMPLES=ON ..
         
make -j$(sysctl -n hw.physicalcpu)
make install
 
cd $cwd
