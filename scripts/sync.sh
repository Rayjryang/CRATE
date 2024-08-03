#!/bin/bash

# 指定源目录和目标目录
SOURCE_DIR="/mnt/localssd/logs/"
DEST_DIR="/sensei-fs/users/jinruiy/code/sc/logs/"

# 无限循环，每5分钟运行一次
while true
do
    # 使用rsync同步目录
    rsync -av --delete "$SOURCE_DIR" "$DEST_DIR"

    # 等待300秒（5分钟）
    sleep 300
done
