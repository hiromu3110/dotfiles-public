# Optional

[ which &>/dev/null gcp ] && alias cp='gcp'
[ which &>/dev/null gmv ] && alias mv='gmv'
[ which &>/dev/null gls ] && alias ls='gls -h --color=auto'
[ which &>/dev/null tree ] && alias tree='tree -CN'
[ which &>/dev/null mysql ] && alias mysql='mysql --default-character-set=utf8'
[ which &>/dev/null screen ] && alias scr='screen -d -R'
[ ! which &>/dev/null sudoedit ] && alias sudoedit='sudo -e' # define sudoedit unless exists

if [ which &>/dev/null wol ] && [ ! which &>/dev/null wakeonlan ]; then
  alias wakeonlan='wol'
fi
if [ which &>/dev/null wakeonlan ] && [ ! which &>/dev/null wol ]; then
  alias wol='wakeonlan'
fi

vless=`find /usr/share/vim -type f -name 'less.sh' 2>/dev/null | head -1`
[ -x "$vless" ] && alias vless="$vless"
unset vless

macvim=~/Applications/MacVim.app/Contents/MacOS/Vim
if [ -x "$macvim" ]; then
  alias vi="$macvim"
  alias gvim="$macvim -g >/dev/null"
fi
unset macvim
