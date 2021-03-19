ROOT_PATH := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
CANDIDATES := $(wildcard .??*)
EXCLUSIONS := .DS_Store .git .gitmodules
DOTFILES   := $(filter-out $(EXCLUSIONS), $(CANDIDATES))

all:

test:
	@echo HOME $(HOME)
	@echo ROOT_PATH $(ROOT_PATH)
	@echo CANDIDATES $(CANDIDATES)
	@echo EXCLUSIONS $(EXCLUSIONS)
	@echo DOTFILES $(DOTFILES)
	@echo $(ROOT_PATH)'/etc/script'
	@INITPATH=$(ROOT_PATH) bash $(ROOT_PATH)/etc/script/prezto.sh;

ls:
	@$(foreach val, $(DOTFILES), /bin/ls -dF $(val);)

deploy:
	@echo '==> Start to deploy dotfiles.'
	# prezto導入
	@INITPATH=$(ROOT_PATH) bash $(ROOT_PATH)/etc/script/prezto.sh;

	# dotfilesのシンボリックリンク作成
	@$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)
	@echo '==> End to deploy dotfiles.'

init:
	@INITPATH=$(ROOT_PATH) bash $(ROOT_PATH)/etc/script/brew.sh;

install: deploy init
