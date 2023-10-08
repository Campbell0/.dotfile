#!/bin/bash

# 指定 dotfiles 仓库路径
dotfiles_dir="$HOME/.dotfiles" # 根据实际情况修改路径

# 需要链接的配置文件列表
files=(
  .bashrc
  .vimrc
  .zshrc
  # 添加其他文件或目录
)

# 创建链接
for file in "${files[@]}"; do
  target="$HOME/$file"
  source="$dotfiles_dir/$file"
  
  if [ -e "$target" ]; then
    echo "备份现有的 $file 至 $target.backup"
    mv "$target" "$target.backup"
  fi
  
  echo "链接 $file 至 $source"
  ln -s "$source" "$target"
done
