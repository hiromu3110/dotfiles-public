# Optional

[ "$(which 2>/dev/null gcp)" ] && alias cp='gcp'
[ "$(which 2>/dev/null gmv)" ] && alias mv='gmv'
[ "$(which 2>/dev/null gls)" ] && alias ls='gls -h --color=auto'
[ "$(which 2>/dev/null tree)" ] && alias tree='tree -CN'
[ "$(which 2>/dev/null mysql)" ] && alias mysql='mysql --default-character-set=utf8'
[ "$(which 2>/dev/null colordiff)" ] && alias diff='colordiff'
[ "$(which 2>/dev/null screen)" ] && alias scr='screen -d -R'
[ ! "$(which 2>/dev/null sudoedit)" ] && alias sudoedit='sudo -e' # define sudoedit unless exists

if [ "$(which 2>/dev/null wol)" ] && [ ! "$(which 2>/dev/null wakeonlan)" ]; then
  alias wakeonlan='wol'
fi
if [ "$(which 2>/dev/null wakeonlan)" ] && [ ! "$(which 2>/dev/null wol)" ]; then
  alias wol='wakeonlan'
fi

vless=`find /usr/share/vim -type f -name 'less.sh' 2>/dev/null | head -1`
[ -x "$vless" ] && alias vless="$vless"
unset vless

macvim=~/Applications/MacVim.app/Contents/MacOS/Vim
if [ -x "$macvim" ]; then
  alias vi="$macvim"
  alias gvim="$macvim -g 2>/dev/null"
fi
unset macvim
