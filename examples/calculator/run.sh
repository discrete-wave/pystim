#!/bin/bash


if [ -z "${PY_STIM_INSTALL_DIR}" ]; then
    echo "PY_STIM_INSTALL_DIR is not defined"
    exit 1
fi

EXAMPLE_NAME="calculator"
WORK_DIR=$PY_STIM_INSTALL_DIR/examples/$EXAMPLE_NAME
export PYSTIM_EXAMPLE_SRC_DIR=$WORK_DIR/src

export PYTHONPATH=${PYTHONPATH}:${PYSTIM_EXAMPLE_SRC_DIR}

# Add your script code here
echo "Running simulation..."
echo "PY_STIM_INSTALL_DIR=$PY_STIM_INSTALL_DIR"
vlog -O0 +acc  -f $WORK_DIR/list/compile_list.f
vsim -voptargs=+acc -c  -lib work simple_calc -do "run -all; quit"  -l run.log   -sv_lib $PY_STIM_INSTALL_DIR/lib/libpystim -gblso $PY_STIM_INSTALL_DIR/lib/libpystim.so

echo "Simulation complete!"

