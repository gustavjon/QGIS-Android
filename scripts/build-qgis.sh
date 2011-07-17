source ~/dev/qgis-mobile/scripts/config.conf

#TODO
#fix QT_QTUITOOLS_INCLUDE_DIR=/usr/include/qt4/QtUiTools \
#check -DEXPAT_INCLUDE_DIR=/usr/include \
#check GSL
ccmake \
-DANDROID=ON \
-DARM_TARGET=$ARM_TARGET \
-DBISON_EXECUTABLE=/usr/bin/bison \
-DCFLAGS='-march=armv7-a -mfloat-abi=softfp' \
-DCMAKE_BUILD_TYPE=Debug \
-DCMAKE_INSTALL_PREFIX=$INSTALL_DIR \
-DCMAKE_TOOLCHAIN_FILE=$SCRIPT_DIR/android.toolchain.cmake \
-DEXECUTABLE_OUTPUT_PATH=$INSTALL_DIR/$ARM_TARGET/bin \
-DLIBRARY_OUTPUT_PATH_ROOT=$INSTALL_DIR \
-DEXPAT_INCLUDE_DIR=$INSTALL_DIR/include \
-DEXPAT_LIBRARY=$INSTALL_DIR/lib/libexpat.so \
-DFLEX_EXECUTABLE=/usr/bin/flex \
-DGDAL_CONFIG=$INSTALL_DIR/bin/gdal-config \
-DGDAL_CONFIG_PREFER_FWTOOLS_PAT=/bin_safe \
-DGDAL_CONFIG_PREFER_PATH=/bin \
-DGDAL_INCLUDE_DIR=$INSTALL_DIR/include/gdal \
-DGDAL_LIBRARY=$INSTALL_DIR/lib/libgdal.so \
-DGEOS_CONFIG=$INSTALL_DIR/bin/geos-config \
-DGEOS_CONFIG_PREFER_PATH=/bin \
-DGEOS_INCLUDE_DIR=$INSTALL_DIR/include \
-DGEOS_LIBRARY=$INSTALL_DIR/lib/libgeos_c.so \
-DGEOS_LIB_NAME_WITH_PREFIX=-lgeos_c \
-DGSL_CONFIG=/usr/bin/gsl-config \
-DGSL_CONFIG_PREFER_PATH=/bin \
-DGSL_EXE_LINKER_FLAGS=-Wl,-rpath, \
-DLDFLAGS='-Wl,--fix-cortex-a8' \
-DPEDANTIC=ON \
-DPROJ_INCLUDE_DIR=$INSTALL_DIR/include \
-DPROJ_LIBRARY=$INSTALL_DIR/lib/libproj.so \
-DQT_QMAKE_EXECUTABLE=$QMAKE \
-DQT_QTUITOOLS_INCLUDE_DIR=/usr/include/qt4/QtUiTools \
-DQWT_INCLUDE_DIR=$SRC_DIR/qwt-5.2.0/src \
-DQWT_LIBRARY=$INSTALL_DIR/lib/libqwt.so \
-DWITH_APIDOC=OFF \
-DWITH_ASTYLE=OFF \
-DWITH_BINDINGS=OFF \
-DWITH_GLOBE=OFF \
-DWITH_GRASS=OFF \
-DWITH_INTERNAL_QWTPOLAR=ON \
-DWITH_INTERNAL_SPATIALITE=ON \
-DWITH_MAPSERVER=OFF \
-DWITH_POSTGRESQL=OFF \
-DWITH_SPATIALITE=ON \
-DWITH_TXT2TAGS_PDF=OFF \
..

make -j$CORES install
