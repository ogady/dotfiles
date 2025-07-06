#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

############################
# 分割ファイルの読み込み
############################
ZSHHOME="${HOME}/dotfiles/.zsh"

if [ -d $ZSHHOME -a -r $ZSHHOME -a \
     -x $ZSHHOME ]; then
    for i in $ZSHHOME/*; do
        [[ ${i##*/} = *.zsh ]] &&
            [ \( -f $i -o -h $i \) -a -r $i ] && . $i
    done
fi

# Customize to your needs...

##############
# peco
##############
## ctl+rでサジェスト表示
function select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(fc -l -n 1 | eval $tac | peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle -R -c
}
zle -N select-history
bindkey '^r' select-history

##############
# timeコマンド
##############
TIMEFMT=$'\n\n========================\nProgram : %J\nCPU     : %P\nuser    : %*Us\nsystem  : %*Ss\ntotal   : %*Es\n========================\n'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# kubectl completion
[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)

# gcloud completion
source '/opt/homebrew/share/google-cloud-sdk/completion.zsh.inc'


eval "$(direnv hook zsh)"
eval "$(pyenv init -)"
eval "$(nodenv init -)"

# Claude Code Switch Bedrock <-> Claude
claude_bedrock() {
  CLAUDE_CODE_USE_BEDROCK=1 ANTHROPIC_MODEL=us.anthropic.claude-sonnet-4-20250514-v1:0 ANTHROPIC_SMALL_FAST_MODEL=us.anthropic.claude-3-5-haiku-20241022-v1:0 CLAUDE_CODE_MAX_OUTPUT_TOKENS=8192 claude
}

claude_pro() {
  unset CLAUDE_CODE_USE_BEDROCK
  unset ANTHROPIC_MODEL
  unset ANTHROPIC_SMALL_FAST_MODEL
  unset CLAUDE_CODE_MAX_OUTPUT_TOKENS
  claude
}
