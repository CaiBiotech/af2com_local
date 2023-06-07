#!/bin/bash

export NVIDIA_VISIBLE_DEVICES="all"
export TF_FORCE_UNIFIED_MEMORY="1"
export XLA_PYTHON_CLIENT_MEM_FRACTION="4.0"
#export XLA_PYTHON_CLIENT_ALLOCATOR="platform"

#bash mul_fea.sh
#sleep 30

for file in $(find targets -name "*.lst"); do
    filename=$(basename "$file")
    bash predict.sh "targets/$filename"
    sleep 30
done