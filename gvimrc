colorscheme torte

set showtabline=1

if has('gui_macvim')
  set columns=90
  set lines=35
  set antialias
  set guifont=Consolas:h12
  set imdisable
  set transparency=15
elseif has('gui_win32')
  set columns=100
  set lines=40
  "濁点の表記に注意
  "set guifont=モトヤLシータ゛3等幅:h11:cSHIFTJIS
  "set printfont=MS_Gothic:h11:cSHIFTJIS
  set guifont=Ricty:h11:cSHIFTJIS
  "set renderoptions=type:directx,renmode:5
endif
