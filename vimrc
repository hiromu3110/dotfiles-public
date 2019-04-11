syntax on

source ~/.exrc

"外部からの書き換えを反映する．ただし，削除された場合はそのまま
set autoread
set nobackup
set cursorline
set expandtab
"保存せずに他のファイルを表示できるようにする
set hidden
"ハイライト
set hlsearch
set incsearch
"ルーラーを表示
set ruler
"インデントを sw 値の倍数に丸める
set shiftround
set showcmd
set smartcase
set smartindent
set smarttab
set noswapfile
set tagbsearch
set visualbell
"補完候補を表示する
set wildmenu
set backspace=eol,indent,start
set cmdheight=1
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp932,iso-2022-jp,euc-jisx0213,euc-jp
set laststatus=2
set listchars=tab:>\ ,trail:$
set nrformats=alpha
set tabstop=2
set termencoding=utf-8
set scrolloff=8
set shiftwidth=2
set softtabstop=0

if v:version >= 703
  set noundofile
endif
if v:version >= 800
  set nofixendofline
endif

noremap j  gj
noremap k  gk
noremap gj j
noremap gk k
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

filetype plugin indent on

autocmd Filetype c,cpp,cs,java,scala setlocal ts=4 sw=4 ci noet
autocmd Filetype javascript          setlocal ts=4 sw=4 ci et
autocmd Filetype php                 setlocal ts=2 sw=2 ci et
autocmd Filetype gitconfig           setlocal ts=4 sw=4 noet
