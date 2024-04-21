#!/bin/bash

C_OUT_DIR=out_rv
C_OUT_INSTALL_DIR=out_install
C_PLATFORM=generic
C_PLATFORM_DEFCONFIG=defconfig
C_CROSS_COMPILE=riscv64-linux-gnu-
C_QEMU=qemu-system-riscv64

if [ $# -eq 0 ];then
	echo './run.sh d  (defconfig)'
	echo './run.sh m  (menuconfig)'
	echo './run.sh c  (compile)'
	echo './run.sh i  (install)'
	echo './run.sh q  (qemu)'
	exit 1
fi

if [ "x$1" == "xd" ];then
	make O=${C_OUT_DIR} I=${C_OUT_INSTALL_DIR} CROSS_COMPILE=${C_CROSS_COMPILE} PLATFORM=${C_PLATFORM} PLATFORM_DEFCONFIG=${C_PLATFORM_DEFCONFIG}
fi

if [ "x$1" == "xm" ];then
	make O=${C_OUT_DIR} I=${C_OUT_INSTALL_DIR} CROSS_COMPILE=${C_CROSS_COMPILE} PLATFORM=${C_PLATFORM} menuconfig
fi

if [ "x$1" == "xc" ];then
	make O=${C_OUT_DIR} I=${C_OUT_INSTALL_DIR} CROSS_COMPILE=${C_CROSS_COMPILE} PLATFORM=${C_PLATFORM} -j4
fi

if [ "x$1" == "xi" ];then
	make O=${C_OUT_DIR} I=${C_OUT_INSTALL_DIR} CROSS_COMPILE=${C_CROSS_COMPILE} PLATFORM=${C_PLATFORM} install
fi

if [ "x$1" == "xq" ];then
	echo "qemu"
fi

