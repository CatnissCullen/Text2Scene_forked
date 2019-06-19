#!/bin/bash
set -x
set -e
export PYTHONUNBUFFERED="True"

LOG="experiments/logs/sample7_eval.txt.`date +'%Y-%m-%d_%H-%M-%S'`"
exec &> >(tee -a "$LOG")
echo Logging output to "$LOG"

time ./tools/puzzle_model_inference.py --for_visualization=False --cuda --use_super_category=True --use_patch_background=True --n_shape_hidden=256 --where_attn=2 --where_attn_2d=True --pretrained=train7
