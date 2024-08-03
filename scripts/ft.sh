python ../finetune_crate_alpha.py \
  --bs 256  \
  --net CRATE_alpha_base  \
  --opt adamW  \
  --lr 5e-5 \
  --n_epochs 200 \
  --randomaug 1 \
  --patch 16 \
  --data cifar10 \
  --ckpt_dir /HDD_data_storage_2u_1/jinruiyang/shared_space/code/SCLIP/clip/converted_checkpoints/crate_alpha_B16.pth 
