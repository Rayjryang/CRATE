#!/bin/bash

# 定义数据集和类数的配对数组
datasets=("cifar10" "cifar100" "flower" "pets")
classes=("10" "100" "102" "37")

# 循环遍历每一个配对
for i in "${!datasets[@]}"; do
  data=${datasets[$i]}
  class=${classes[$i]}

  # 执行Python脚本
  python ../finetune_crate_alpha.py \
    --bs 256  \
    --net CRATE_alpha_base  \
    --opt adamW  \
    --lr 5e-5 \
    --n_epochs 200 \
    --randomaug 1 \
    --patch 16 \
    --data "$data" \
    --classes "$class" \
    --ckpt_dir /HDD_data_storage_2u_1/jinruiyang/shared_space/code/SCLIP/clip/converted_checkpoints/crate_alpha_B16.pth
done
