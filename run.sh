#!/usr/bin/env bash
set -ex
export http_proxy="http://10.240.252.15:911/"
export https_proxy="http://10.240.252.15:912/"
BIN=`dirname ${0}`
BIN=`cd ${BIN}; pwd`
ROOT=${BIN}

export ENABLE_EXPERIMENTAL_FLAGS=1
export VISUALIZATION_MODE=0
export GRAPH_VISUALIZATION=1
export SRAM_SLICER_MAX_CAPACITY_BYTES=0
export ENABLE_GVD=0
#export HABANA_LOGS=`pwd`/logs
#export LOG_LEVEL_ALL=1

export PYTHONPATH=${ROOT}/src:{PYTHONPATH}

python test.py

