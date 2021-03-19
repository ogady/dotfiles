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

ls:
	@$(foreach val, $(DOTFILES), /bin/ls -dF $(val);)

deploy:
	@echo '==> Start to deploy dotfiles.'
	@$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)
	@echo '==> End to deploy dotfiles.'

init:
	@INITPATH=$(ROOT_PATH) bash $(ROOT_PATH)/etc/script/brew.sh;
	@INITPATH=$(ROOT_PATH) bash $(ROOT_PATH)/etc/script/prezto.sh;

install: deploy init
