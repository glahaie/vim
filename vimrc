" ~/.vimrc (configuration file for vim only)
" skeletons
function! SKEL_spec()
	0r /usr/share/vim/current/skeletons/skeleton.spec
	language time en_US
	if $USER != ''
	    let login = $USER
	elseif $LOGNAME != ''
	    let login = $LOGNAME
	else
	    let login = 'unknown'
	endif
	let newline = stridx(login, "\n")
	if newline != -1
	    let login = strpart(login, 0, newline)
	endif
	if $HOSTNAME != ''
	    let hostname = $HOSTNAME
	else
	    let hostname = system('hostname -f')
	    if v:shell_error
		let hostname = 'localhost'
	    endif
	endif
	let newline = stridx(hostname, "\n")
	if newline != -1
	    let hostname = strpart(hostname, 0, newline)
	endif
	exe "%s/specRPM_CREATION_DATE/" . strftime("%a\ %b\ %d\ %Y") . "/ge"
	exe "%s/specRPM_CREATION_AUTHOR_MAIL/" . login . "@" . hostname . "/ge"
	exe "%s/specRPM_CREATION_NAME/" . expand("%:t:r") . "/ge"
	setf spec
endfunction
autocmd BufNewFile	*.spec	call SKEL_spec()
" filetypes
set nocompatible
execute pathogen#infect()

" Pour nerdCommenter, entre autre
filetype plugin indent on
syntax on
filetype indent on
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set number
set pdev=pdf
set encoding=utf-8
set hidden
set hlsearch
set incsearch
set nobackup
set noswapfile
set printoptions=paper:letter,syntax:n,number:y,wrap:y,left:10mm,right:10mm
if has("gui_running")
    " GUI is running is about to start.
    " Maximize gvim window.
    set lines=100 columns=100
endif

" Choix du style de couleur
" Pour le moment on essaie solarized
syntax enable
set background=dark
colorscheme jellybeans

" Map Ctrl+n à l'ouverture de nerdtree
map <C-n> :NERDTreeToggle<CR>

"On redéfinit <leader> à _
let mapleader = "_"

"Pour airline - pour afficher à l'ouverture
set laststatus=2
let g:airline_powerline_fonts = 1
set nocompatible
" ~/.vimrc ends here
