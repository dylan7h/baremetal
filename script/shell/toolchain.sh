#!/bin/bash
RELATIVE_DIR=`dirname "$0"`
CANONICAL_DIR=`readlink -f $RELATIVE_DIR`
DOWLOAD_DIR=${CANONICAL_DIR}/../../tools/download
TOOLCHAIN_DIR=${CANONICAL_DIR}/../../tools/toolchain

if ! [ -x "$(command -v aria2c)" ]; then
    echo "Installing aria2"
    sudo apt install aria2 -y
fi

if ! [ -x "$(command -v pv)" ]; then
    echo "Installing pv"
    sudo apt install pv -y
fi

HOST_ARCH="x86_64"
HOST_DISTRIB="ubuntu-20.04"
LLVM_VER="13.0.0"
ARM_VER="10.3-2021.07"

ARM_A_URL_PRFIX="https://developer.arm.com/-/media/Files/downloads"
LLVM_URL_PREFIX="https://github.com/llvm/llvm-project/releases/download/llvmorg-${LLVM_VER}"

LLVM="clang+llvm-${LLVM_VER}-${HOST_ARCH}-linux-gnu-${HOST_DISTRIB}"
ARM_NONE_EABI="gcc-arm-${ARM_VER}-${HOST_ARCH}-arm-none-eabi"
AACH64_NONE_ELF="gcc-arm-${ARM_VER}-${HOST_ARCH}-aarch64-none-elf"

URLS+="${LLVM_URL_PREFIX}/${LLVM}.tar.xz "
URLS+="${ARM_A_URL_PRFIX}/gnu-a/${ARM_VER}/binrel/${ARM_NONE_EABI}.tar.xz "
URLS+="${ARM_A_URL_PRFIX}/gnu-a/${ARM_VER}/binrel/${AACH64_NONE_ELF}.tar.xz "

for i in $URLS; do
    name=${i##*/}
    if ! [ -f $DOWLOAD_DIR/$name ]; then
        TARGET_URLS+="$i "
        TARGET_TOOLCHAINS+="${name%%.tar.xz} "
    fi
done

# Download ToolChain
mkdir -p $DOWLOAD_DIR
if [ ! -z "$TARGET_URLS" ]; then
    echo ">> Downloading ToolChain..."
    aria2c -d "${DOWLOAD_DIR}" -Z $TARGET_URLS
fi

# Decompressing ToolChain & Create a symbolic link
mkdir -p $TOOLCHAIN_DIR
for i in $TARGET_TOOLCHAINS; do
    echo ">> decompressing $i.tar.xz ..."
    pv "$DOWLOAD_DIR/$i.tar.xz" | tar -xJf- -C $TOOLCHAIN_DIR/

    case $i in
        *arm-none-eabi*)    symbolic=arm-none-eabi;;
        *aarch64-none-elf*) symbolic=aarch64-none-elf;;
        *llvm*)             symbolic=llvm;;
        *)                  echo unknown target; exit 1 ;;
    esac

    echo Create a symbolic link with $i as $symbolic
    ln -s $TOOLCHAIN_DIR/$i $TOOLCHAIN_DIR/$symbolic
    echo ""
done
