#!/bin/sh
BOARD_DIR="$(dirname $0)"

LINUX_ON_VEXRISCV_OUT_DIR=$BOARD_DIR/../../../images
SRC_BOOTJSON=$LINUX_ON_VEXRISCV_OUT_DIR/boot.json
SRC_DTB=$LINUX_ON_VEXRISCV_OUT_DIR/rv32.dtb

rm -f $BINARIES_DIR/opensbi.bin
ln -s $BINARIES_DIR/fw_jump.bin $BINARIES_DIR/opensbi.bin

if [ -e $SRC_BOOTJSON ]; then
	cp $SRC_BOOTJSON $BINARIES_DIR/
else
	echo "Warning: missing file $SRC_BOOTJSON"
	echo "a dummy file will be created"
	echo "must be replaced manually by required boot.json"
	touch $BINARIES_DIR/boot.json
fi

if [ -e $SRC_DTB ]; then
	cp $SRC_DTB $BINARIES_DIR/
else
	echo "Warning: missing file $SRC_DTB"
	echo "a dummy file will be created"
	echo "must be replaced manually by required rv32.dtb"
	touch $BINARIES_DIR/rv32.dtb
fi
