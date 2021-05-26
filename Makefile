ROOT_PATH := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
CANDIDATES := $(wildcard .??*)
EXCLUSIONS := .DS_Store .git .gitmodules
SHELL_CANDIDATES := $(wildcard ./etc/script/??*)
SHELL_EXCLUSIONS := ./etc/script/git.sh
DOTFILES := $(filter-out $(EXCLUSIONS), $(CANDIDATES))
SHELLS := $(filter-out $(SHELL_EXCLUSIONS), $(SHELL_CANDIDATES))
GIT_USER = ""
GIT_EMAIL = ""

all:
	
ls:
	@$(foreach val, $(DOTFILES), /bin/ls -dF $(val);)
	@$(foreach val, $(SHELLS), /bin/ls -dF $(val);)

deploy:
	@echo '==> Start to deploy dotfiles.'
	
	# dotfilesのシンボリックリンク作成
	@$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)
	# preztoのシンボリックリンク作成
	@ln -sf ~/dotfiles/prezto ~/.zprezto

	@echo '==> End to deploy dotfiles.'

init:
	@$(foreach val, $(SHELLS), INITPATH=$(ROOT_PATH) bash $(val);)

git_init:
	# gitconfig設定
	@INITPATH=$(ROOT_PATH) bash $(ROOT_PATH)/etc/script/git.sh $(GIT_USER) $(GIT_EMAIL);

install: deploy init git_init
