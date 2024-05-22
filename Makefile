REPO_NAME := tunalad
ARCH_DIR := x86_64

.PHONY: all clean

all: update

update:
	@if [ -d $(ARCH_DIR) ]; then \
		echo -e "\033[1;32mUPDATING $(ARCH_DIR)"; \
		repo-add $(ARCH_DIR)/$(REPO_NAME).db.tar.gz $(ARCH_DIR)/*.pkg.tar.zst; \
		# removing symlinks \
		rm -f $(ARCH_DIR)/$(REPO_NAME).db; \
		rm -f $(ARCH_DIR)/$(REPO_NAME).files; \
		# renaming archive files to symlink names \
		mv $(ARCH_DIR)/$(REPO_NAME).db.tar.gz $(ARCH_DIR)/$(REPO_NAME).db; \
		mv $(ARCH_DIR)/$(REPO_NAME).files.tar.gz $(ARCH_DIR)/$(REPO_NAME).files; \
	fi

clean:
	rm -rf pkgbuilds/*/*.tar*
	rm -rf pkgbuilds/*/pkg
	rm -rf pkgbuilds/*/src
	rm -rf pkgbuilds/*/dwm
	rm -rf pkgbuilds/*/dwl
	rm -rf $(ARCH_DIR)/$(REPO_NAME)*

check_db:
	@echo -e "Listing packages in \033[1;32m$(ARCH_DIR)/$(REPO_NAME).db\033[0m"; \
	tar -tf $(ARCH_DIR)/$(REPO_NAME).db | grep '/desc' | sed 's|/desc||'

check_files:
	@echo -e "Listing contents in \033[1;32m$(ARCH_DIR)/$(REPO_NAME).files\033[0m"; \
	tar -tf $(ARCH_DIR)/$(REPO_NAME).files | grep '/desc' | sed 's|/desc||'
