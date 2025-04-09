#!/bin/bash


if [ -z "${PY_STIM_INSTALL_DIR}" ]; then
    echo "PY_STIM_INSTALL_DIR is not defined"
    exit 1
fi

export PYTHONPATH=${PYTHONPATH}:${PY_STIM_INSTALL_DIR}/examples/add_numbers/src

# Add your script code here
echo "Running simulation..."
echo "PY_STIM_INSTALL_DIR=$PY_STIM_INSTALL_DIR"
vlog -O0 +acc  -f $PY_STIM_INSTALL_DIR/examples/add_numbers/list/compile_list.f
vsim -voptargs=+acc -c  -lib work add_numbers -do "run -all; quit"  -l run.log   -sv_lib $PY_STIM_INSTALL_DIR/lib/libpystim -gblso $PY_STIM_INSTALL_DIR/lib/libpystim.so

echo "Simulation complete!"

