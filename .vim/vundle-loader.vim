set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator' " generates YCM config files for C-family languages
let g:ycm_autoclose_preview_window_after_insertion = 1
if isdirectory('/usr/src/rust')
	let g:ycm_rust_src_path = '/usr/src/rust'
endif

Plugin 'sheerun/vim-polyglot'
let g:rust_recommended_style = 0

Plugin 'Raimondi/delimitMate'

Plugin 'bolasblack/csslint.vim'

Plugin 'Valloric/MatchTagAlways'

Plugin 'airblade/vim-gitgutter'
set updatetime=250

Plugin 'tpope/vim-vinegar'

Plugin 'tomazy/tomorrow-theme', {'rtp': 'vim/'} " chriskempson/tomorrow-theme fork that supports pangloss/vim-javascript
"Plugin 'chriskempson/base16-vim'

call vundle#end()
filetype plugin indent on
