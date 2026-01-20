#!/usr/bin/env bash
# Use: install_deps_ubuntu.sh [ assume-yes ] [ no-filament-deps ]

set -ev

SUDO=${SUDO:=sudo} # SUDO=command in docker (running as root, sudo not available)
options="$(echo "$@" | tr ' ' '|')"
APT_CONFIRM=""
if [[ "assume-yes" =~ ^($options)$ ]]; then
    APT_CONFIRM="--assume-yes"
fi
FILAMENT_DEPS="yes"
if [[ "no-filament-deps" =~ ^($options)$ ]]; then
    FILAMENT_DEPS=""
fi

deps=(
    git
    # Open3D
    xorg-dev
    libxcb-shm0
    libglu1-mesa-dev
    python3-dev
    libssl-dev
    # filament linking
    libc++-dev
    libc++abi-dev
    libsdl2-dev
    libxi-dev
    # ML
    libtbb-dev
    # Headless rendering
    libosmesa6-dev
    # RealSense
    libudev-dev
    autoconf
    libtool
)

if [[ "$FILAMENT_DEPS" ]]; then     # Filament build-from-source
    deps+=(clang
        ninja-build
    )
fi

eval $(
    source /etc/lsb-release;
    echo DISTRIB_ID="$DISTRIB_ID";
    echo DISTRIB_RELEASE="$DISTRIB_RELEASE"
)

# Special case for ARM64
if [ "$(uname -m)" == "aarch64" ]; then
    # For compiling LAPACK in OpenBLAS
    deps+=("gfortran")
fi

echo "apt-get install ${deps[*]}"
$SUDO apt-get update
$SUDO apt-get install ${APT_CONFIRM} ${deps[*]}
