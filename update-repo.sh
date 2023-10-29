#!/bin/sh

REPO_NAME="tunalad"
ARCH=("any" "x86_64")

update_arch (){
    repo-add $REPO_NAME.db.tar.gz *.pkg.tar.zst
    rm $REPO_NAME.db $REPO_NAME.files
    mv $REPO_NAME.db.tar.gz $REPO_NAME.db
    mv $REPO_NAME.files.tar.gz $REPO_NAME.files
}

for arch_dir in "${ARCH[@]}"; do
    if cd $arch_dir; then
        echo -e "\033[1;32mUPDATING $arch_dir"
        update_arch
        cd ..
    fi
done
