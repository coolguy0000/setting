" Editor Appearance
colorscheme flattened_dark
set guifont=Jetbrains\ Mono:h12

" Editor Setting
set laststatus=1
:set encoding=utf-8 
set ai 
"set t_Co=256
set ruler  
set tabstop=4 
set shiftwidth=4
set expandtab
set softtabstop=4
set nu
set relativenumber
set backspace=2
syntax enable
set mouse=a
set cindent
set incsearch
"set hlsearch

set vb t_vb=
au GuiEnter * set t_vb=
set noundofile
set nobackup

set ignorecase 

imap <C-a> <esc>ggVG
imap <C-x> <esc>"+y
imap <C-v> <esc>"+p
imap <C-shift-enter> <esc>o
imap <C-enter> <esc>o
"vmap <C-a> <esc>ggVG
"vmap <C-c> "+yi
"vmap <C-v> <esc>"+pi

"map <f5> :call CompileRunGpp()<cr>
"func! CompileRunGpp()
"exec "w"
"exec "!g++ % -o %<"
"exec "! %<"
"endfunc

"autocmd filetype cpp nnoremap <F9> :w <bar> !g++ -std=c++14 % -o %:r -Wl,--stack,268435456<CR>
"autocmd filetype cpp nnoremap <F10> :!%:r<CR>










function! TermWrapper(command) abort
	if !exists('g:split_term_style') | let g:split_term_style = 'vertical' | endif
	if g:split_term_style ==# 'vertical'
		let buffercmd = 'vnew'
	elseif g:split_term_style ==# 'horizontal'
		let buffercmd = 'new'
	else
		echoerr 'ERROR! g:split_term_style is not a valid value (must be ''horizontal'' or ''vertical'' but is currently set to ''' . g:split_term_style . ''')'
		throw 'ERROR! g:split_term_style is not a valid value (must be ''horizontal'' or ''vertical'')'
	endif
	if exists('g:split_term_resize_cmd')
		exec g:split_term_resize_cmd
	endif
	exec buffercmd
	exec 'term ' . a:command
	exec 'startinsert'
endfunction


command! -nargs=0 CompileAndRun call TermWrapper(printf('g++ -std=c++11 %s && ./a.out', expand('%')))
command! -nargs=1 CompileAndRunWithFile call TermWrapper(printf('g++ -std=c++11 %s && ./a.out < %s', expand('%'), <args>))
autocmd FileType cpp nnoremap <leader>fw :CompileAndRun<CR>
