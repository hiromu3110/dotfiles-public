# Optional

[ $(which gcp) ] && alias cp='gcp'
[ $(which gmv) ] && alias mv='gmv'
[ $(which gls) ] && alias ls='gls -h --color=auto'
[ $(which tree) ] && alias tree='tree -CN'
[ $(which mysql) ] && alias mysql='mysql --default-character-set=utf8'
[ $(which screen) ] && alias scr='screen -d -R'
[ ! $(which sudoedit) ] && alias sudoedit='sudo -e' # define sudoedit unless exists

if [ $(which wol) ] && [ ! $(which wakeonlan) ]; then
  alias wakeonlan='wol'
fi
if [ $(which wakeonlan) ] && [ ! $(which wol) ]; then
  alias wol='wakeonlan'
fi

if [ $(which wol) ] || [ $(which wakeonlan) ]; then
  alias wol-desktop='wol D0:50:99:9D:5A:A1'
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
