include(FetchContent)

FetchContent_Declare(
    ext_pybind11
    PREFIX pybind11
    URL https://github.com/pybind/pybind11/archive/refs/tags/v2.13.1.tar.gz
    URL_HASH SHA256=51631e88960a8856f9c497027f55c9f2f9115cafb08c0005439838a05ba17bfc
    DOWNLOAD_DIR "${OPEN3D_THIRD_PARTY_DOWNLOAD_DIR}/pybind11"
)

FetchContent_MakeAvailable(ext_pybind11)

#    URL https://github.com/pybind/pybind11/archive/refs/tags/v2.11.1.tar.gz
#    URL_HASH SHA256=d475978da0cdc2d43b73f30910786759d593a9d8ee05b1b6846d1eb16c6d2e0c
