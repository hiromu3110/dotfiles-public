export PATH=$HOME/bin:$PATH

# スクリプトとして実行される場合，以降の設定をスキップ
[ -z "$PS1" ] && return

export LANG=ja_JP.UTF-8
export EDITOR=vim
export PAGER='less -Mis'

# Bash 関係
export HISTCONTROL=ignoreboth
export HISTSIZE=9999
export HISTTIMEFORMAT='%F %T %z '

# 仮想端末のタイトルが変更されるのを防ぐ
export PROMPT_COMMAND=''

[ -d "$HOME/tmp" ] && export TMP="$HOME/tmp"

[ "$(which 2>/dev/null rbenv)" ] && eval "$(rbenv init -)"

# ctrl+s でスクリーンロックが掛かるのを防ぐ
stty stop undef
stty start undef

# Ctrl-w を無視（代わりに backward-kill-word を有効化）
stty werase undef

[ -f ~/dotfiles/custom-profile.bash ] && . ~/dotfiles/custom-profile.bash

# .bashrc を読み込む
# ただし，無限ループを防ぐため screen からの呼び出しの場合は何もしない
if [ -z "$WINDOW" ]; then
  [ -f ~/.bashrc ] && . ~/.bashrc
fi
