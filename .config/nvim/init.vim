if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fsSL ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter + PlugInstall
endif

" Start User Plugins
call plug#begin()

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
  Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
  Plug 'neomake/neomake', { 'on': 'Neomake' }

" Color Schemes
  Plug 'smallwat3r/vim-mono_sw'
  Plug 'LuRsT/austere.vim'
  Plug 'smallwat3r/vim-hashpunk-sw'
  Plug 'beikome/cosme.vim'
  Plug 'maksimr/Lucius2'
  Plug 'patstockwell/vim-monokai-tasty'
  Plug 'semibran/vim-colors-synthetic'
  Plug 'fcpg/vim-orbital'
  Plug 'wesgibbs/vim-irblack'
  Plug 'neutaaaaan/monosvkem'
  Plug 'vim-scripts/Gummybears'
  Plug 'treycucco/vim-monotonic'
  Plug 'wolf-dog/nighted.vim'
  Plug 'andreypopp/vim-colors-plain'

" Javascript 
  Plug 'pangloss/vim-javascript'
  Plug 'carlitux/deoplete-ternjs'
  Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }

" Typescript 
  Plug 'Shougo/vimproc.vim', { 'do': 'make' }
  Plug 'Quramy/tsuquyomi'
  Plug 'mhartington/deoplete-typescript'

" File Management & Search
  Plug 'kien/ctrlp.vim'

" Folding & Viewability
  Plug 'tmhedberg/SimpylFold'

" Indentation
  Plug 'vim-scripts/indentpython.vim'

" Status 
"  Plug 'vim-airline/vim-airline'
"  Plug 'vim-airline/vim-airline-themes'

" Syntax
  Plug 'nvie/vim-flake8'
call plug#end()

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#max_abbr_width = 0
let g:deoplete#max_menu_width = 0
let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})

let g:tern_request_timeout = 1
let g:tern_request_timeout = 6000
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
let g:deoplete#sources#tss#javascript_support = 1
let g:tsuquyomi_javascript_support = 1
let g:tsuquyomi_auto_open = 1
let g:tsuquyomi_disable_quickfix = 1

autocmd! BufWritePost * Neomake
~/.config/nvim/init.vim                                                 45,1           80%
let g:deoplete#max_menu_width = 0
let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})
call deoplete#custom#set('_', 'matchers', ['matcher_full_fuzzy'])

let g:tern_request_timeout = 1
let g:tern_request_timeout = 6000
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
let g:deoplete#sources#tss#javascript_support = 1
let g:tsuquyomi_javascript_support = 1
let g:tsuquyomi_auto_open = 1
let g:tsuquyomi_disable_quickfix = 1

autocmd! BufWritePost * Neomake
let g:neomake_warning_sign = {
  \ 'text': '?',
  \ 'texthl': 'WarningMsg',
  \ }

let g:neomake_error_sign = {
  \ 'text': 'X',
  \ 'texthl': 'ErrorMsg',
  \ }

" Syntax
syntax on
let python_highlight_all=1


" Line Numbering
set nu


" >" vim-airline settings
" >let g:airline#extensions#tabline#enabled = 2
" >let g:airline#extensions#tabline#fnamemod = ':t'
" >let g:airline#extensions#tabline#left_sep = ' '
" >let g:airline#extensions#tabline#left_alt_sep = '|'
" >let g:airline#extensions#tabline#right_sep = ' '
" >let g:airline#extensions#tabline#right_alt_sep = '|'
" >let g:airline_left_sep = ' '
" >let g:airline_left_alt_sep = '|'
" >let g:airline_right_sep = ' '
" >let g:airline_right_alt_sep = '|'
" >let g:airline_theme= 'orbital'

" Visual: Default Scheme
if has('gui_running')
	set background=dark
	colorscheme hashpunk-sw
else
	colorscheme hashpunk-sw
endif


" ctrlp: Fuzzy Finder
nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>f :CtrlPMRUFiles<CR>


" NERDtree Alternative - netrw File Management
function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      Vexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction
map <silent> <C-E> :call ToggleVExplorer()<CR>

let g:netrw_browse_split = 4
let g:netrw_altv = 1

set autochdir

" Live Multi-cursor Editing 
"   : ctrl+v + Shift+{I,A} + F12  
nmap <buffer> <silent> <expr> <F12> InsertCol()
imap <buffer> <silent> <expr> <F12> InsertCol()

function! InsertCol()
    let w:first_call = exists('w:first_call') ? 0 : 1
    "if w:first_call
    "    startinsert
    "endif
    try
        let char = getchar()
    catch /^Vim:Interrupt$/
        let char = "\<Esc>"
    endtry
    if char == '^\d\+$' || type(char) == 0
        let char = nr2char(char)
    endif " It is the ascii code.
    if char == "\<Esc>"
        unlet w:first_call
        return char
    endif
    redraw
    if w:first_call
        return char."\<Esc>gvA\<C-R>=Redraw()\<CR>\<F12>"
    else
        return char."\<Esc>gvlA\<C-R>=Redraw()\<CR>\<F12>"
    endif
endfunction

function! Redraw()
    redraw
    return ''
endfunction

