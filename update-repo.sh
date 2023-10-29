#!/bin/sh

REPO_NAME="tunalad"
ARCH=("any" "x86_64")

for arch_dir in "${ARCH[@]}"; do
    if ls "$arch_dir"; then
        echo -e "\033[1;32mUPDATING $arch_dir"
        repo-add "$arch_dir/$REPO_NAME.db.tar.gz" "$arch_dir"/*.pkg.tar.zst
    fi
done
