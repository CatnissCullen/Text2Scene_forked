#!/bin/bash
set -x
set -e
export PYTHONUNBUFFERED="True"

LOG="experiments/logs/train72.txt.`date +'%Y-%m-%d_%H-%M-%S'`"
exec &> >(tee -a "$LOG")
echo Logging output to "$LOG"

time ./tools/train_puzzle_model.py --cuda --parallel --batch_size=4 --margin=0.5 --use_super_category=True --num_workers=1 --use_patch_background=True --n_shape_hidden=256 --what_attn=False --what_attn_2d=False --where_attn=0 --where_attn_2d=False --coco_min_area=0.005 --max_output_length=14
