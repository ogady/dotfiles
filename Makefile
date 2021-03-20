ROOT_PATH := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
CANDIDATES := $(wildcard .??*)
EXCLUSIONS := .DS_Store .git .gitmodules
DOTFILES   := $(filter-out $(EXCLUSIONS), $(CANDIDATES))
GIT_USER = ""
GIT_EMAIL = ""

all:

ls:
	@$(foreach val, $(DOTFILES), /bin/ls -dF $(val);)

deploy:
	@echo '==> Start to deploy dotfiles.'
	# prezto導入
	@INITPATH=$(ROOT_PATH) bash $(ROOT_PATH)/etc/script/prezto.sh;

	# gitconfig設定
	@INITPATH=$(ROOT_PATH) bash $(ROOT_PATH)/etc/script/git.sh $(GIT_USER) $(GIT_EMAIL);
	
	# dotfilesのシンボリックリンク作成
	@$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)
	@echo '==> End to deploy dotfiles.'

init:
	@INITPATH=$(ROOT_PATH) bash $(ROOT_PATH)/etc/script/brew.sh;

install: deploy init
