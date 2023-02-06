#!/bin/bash

# --------------------------------------------
# 設定ファイルのシンボリックリンクをhomeディレクトリに作成
# --------------------------------------------

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

for dotfile in "${SCRIPT_DIR}"/.??*; do
    [[ "$dotfile" == "${SCRIPT_DIR}/.git" ]] && continue
    [[ "$dotfile" == "${SCRIPT_DIR}/.github" ]] && continue
    [[ "$dotfile" == "${SCRIPT_DIR}/.DS_Store" ]] && continue
    [[ "$dotfile" == "${SCRIPT_DIR}/.history" ]] && continue

    ln -fnsv "$dotfile" "$HOME"
done