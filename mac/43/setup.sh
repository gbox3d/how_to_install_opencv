#!/bin/sh -e

#cwd=$(pwd)
#cvVersion="master"

QT5PATH=/usr/local/Cellar/qt/5.14.1
#ENV_PATH=/Users/gbox3d/opt/anaconda3
#ENV_PATH=/Users/gbox3d/opt/anaconda3/envs/opencv3
ENV_PATH=/Users/gbox3d/opt/anaconda3/envs/opencv4

cmake -D CMAKE_BUILD_TYPE=RELEASE \
            -D CMAKE_INSTALL_PREFIX=../../installation/v43 \
            -D INSTALL_C_EXAMPLES=ON \
            -D INSTALL_PYTHON_EXAMPLES=ON \
            -D WITH_TBB=ON \
            -D WITH_V4L=ON \
            -D OPENCV_SKIP_PYTHON_LOADER=ON \
            -D CMAKE_PREFIX_PATH=$QT5PATH \
            -D CMAKE_MODULE_PATH=$QT5PATH/lib/cmake \
            -D OPENCV_PYTHON3_INSTALL_PATH=$ENV_PATH/lib/python3.7/site-packages \
    -D BUILD_opencv_python3=ON \
    -D BUILD_opencv_python2=OFF \
    -D PYTHON3_LIBRARY=$ENV_PATH/lib \
    -D PYTHON3_NUMPY_INCLUDE_DIRS=$ENV_PATH/lib/python3.7/site-packages/numpy/core/include \
    -D PYTHON3_INCLUDE_DIR=$ENV_PATH/include/python3.7m \
            -D WITH_QT=ON \
        -D WITH_OPENGL=ON \
        -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules \
        -D BUILD_EXAMPLES=ON ..
        
#make -j$(sysctl -n hw.physicalcpu)
#make install

#cd $cwd

