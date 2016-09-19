# screen からの呼び出しの場合に .bash_profile を読みにいく
# .bash_profile で定義した環境変数を上書きする環境が存在するため
if [ "$WINDOW" ] || [ "$DISPLAY" ]; then
  [ -f ~/.bash_profile ] && . ~/.bash_profile
  # 重複する PATH を除去する
  export PATH=`echo $PATH | tr ':' '\n' | sort -u | paste -d: -s -`
fi

# デフォルトの bashrc を読み込む
# Mac や Red Hat 向け
[ -f /etc/bashrc ] && . /etc/bashrc
# BSD や Debian 向け
[ -f /etc/bash.bashrc ] && . /etc/bash.bashrc

# SCP 対策
[ -z "$PS1" ] && return

case "$1" in
  "workstation" ) PS1='[\[\033[01;34m\]\w\[\033[00m\]]\$ ' ;;
  "personal"    ) PS1='[\[\033[01;32m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]]\$ ' ;;
  *             ) PS1='[\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]]\$ ' ;;
esac

if [ "$WINDOW" ]; then
  prefix_for_screen='\[\033k\033\\\]$WINDOW:'
  export PS1="$prefix_for_screen$PS1"
  unset prefix_for_screen
else
  export PS1
fi

case `uname` in
  "Linux" )
    . ~/dotfiles/bash-aliases/posix.bash
    . ~/dotfiles/bash-aliases/linux.bash
    . ~/dotfiles/bash-aliases/optional.bash
    ;;
  "Darwin" )
    . ~/dotfiles/bash-aliases/posix.bash
    . ~/dotfiles/bash-aliases/bsd.bash
    . ~/dotfiles/bash-aliases/optional.bash
    ;;
  "FreeBSD" )
    . ~/dotfiles/bash-aliases/posix.bash
    . ~/dotfiles/bash-aliases/bsd.bash
    ;;
  "SunOS" )
    . ~/dotfiles/bash-aliases/posix.bash
    . ~/dotfiles/bash-aliases/solaris.bash
    export PATH=/usr/local/bin:/opt/sfw/bin:/usr/xpg4/bin:/usr/ucb:/usr/ccs/bin:/usr/sfw/bin:/usr/sbin:$PATH
    ;;
esac

# bash-completion を読み込む（読み込み済みの場合はスキップ）
for dir in /etc /usr/local/etc ~/etc ; do
  if [ -z "$BASH_COMPLETION_COMPAT_DIR" ] && \
     [ -f "$dir"/profile.d/bash_completion.sh ]; then
    .     "$dir"/profile.d/bash_completion.sh
    break
  fi
done

# シェルに対する設定は .bashrc に書く
set -o notify
set bell-style visible
# Bash 3 以降に共通の設定
shopt -s checkhash
shopt -s checkwinsize
shopt -s histappend
shopt -s histreedit
shopt -s interactive_comments
shopt -s no_empty_cmd_completion

# Bash 4 以降であれば以下のオプションを有効にする
if [ "${BASH_VERSINFO[0]}" -ge 4 ]; then
  shopt -s autocd
  shopt -s cdspell
  shopt -s checkjobs
  shopt -s dirspell
  shopt -s extglob
  shopt -s extquote
  shopt -s globstar
fi

[ -f ~/dotfiles/custom-rc.bash ] && . ~/dotfiles/custom-rc.bash
