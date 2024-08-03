#!/bin/bash
source /opt/venv/bin/activate

export CUDA_VISIBLE_DEVICES=4,5,6,7

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
    --net CRATE_alpha_large  \
    --opt adamW  \
    --lr 5e-5 \
    --n_epochs 90 \
    --randomaug 1 \
    --patch 14 \
    --data_dir /mnt/localssd/data \
    --save_dir /mnt/localssd/logs \
    --data "$data" \
    --classes "$class" \
    --ckpt_dir /sensei-fs/users/jinruiy/code/sc/checkpoints/crate_alpha_L14_IN21K
done
