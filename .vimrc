" vim:ft=vim fdm=marker:

set t_Co=256

filetype off

set runtimepath+=~/.vim/bundle/vundle

call vundle#begin()
Plugin 'gmarik/vundle'
Plugin 'Shougo/vimproc.vim'
Plugin 'thinca/vim-quickrun'
Plugin 'surround.vim'
Plugin 'othree/eregex.vim'
Plugin 'The-NERD-Commenter'
Plugin 'neocomplcache'
Plugin 'matchit.zip'
Plugin 'moria'
Plugin 'Royal-Colorschemes'
Plugin 'sudo.vim'
Plugin 'visual-increment'
" Plugin 'YankRing.vim'
" Plugin 'stephpy/vim-php-cs-fixer'
Plugin 'fugitive.vim'
Plugin 'ruby.vim'
Plugin 'nginx.vim'
Plugin 'coffee.vim'
Plugin 'vim-coffee-script'
" Plugin 'bpearson/vim-phpcs'
Plugin 'guicolorscheme.vim'
Plugin 'Align'
Plugin 'dbext.vim'
Plugin 'plantuml-syntax'
Plugin 'jellybeans.vim'
Plugin 'mattn/vim-sqlfmt'
Plugin 'StanAngeloff/php.vim'
Plugin '2072/PHP-Indenting-for-VIm'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'xwsoul/vim-zephir'
Plugin 'thinca/vim-zenspace'
Plugin 'pearofducks/ansible-vim'

call vundle#end()
filetype plugin indent on
syntax enable

source $HOME/.vimrc.mine
