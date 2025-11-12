include(ExternalProject)

# 
ExternalProject_Add(
    ext_eigen
    PREFIX eigen
    SOURCE_DIR "${OPEN3D_THIRD_PARTY_DOWNLOAD_DIR}/eigen"
    UPDATE_COMMAND ""
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    INSTALL_COMMAND ""
)

# Tells it where Eigen is
ExternalProject_Get_Property(ext_eigen SOURCE_DIR)
set(EIGEN_INCLUDE_DIRS ${SOURCE_DIR}/Eigen)

