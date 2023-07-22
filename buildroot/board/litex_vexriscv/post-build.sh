#!/bin/sh
BOARD_DIR="$(dirname $0)"

rm -f $BINARIES_DIR/opensbi.bin
ln -s $BINARIES_DIR/fw_jump.bin $BINARIES_DIR/opensbi.bin
