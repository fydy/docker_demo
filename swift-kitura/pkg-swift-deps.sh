#!/bin/bash
BIN="$1"
OUTPUT_TAR="${2:-swift_libs.tar.gz}"
TAR_FLAGS="hczvf"
DEPS=$(ldd $BIN | awk 'BEGIN{ORS=" "}$1\
  ~/^\//{print $1}$3~/^\//{print $3}'\
  | sed 's/,$/\n/')
tar $TAR_FLAGS $OUTPUT_TAR $DEPS