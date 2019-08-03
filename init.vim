"-#vengent.io#- 
"
"--> vim-plug : automatic install
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fsSL ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter + PlugInstall
endif

" Start Plugins
call plug#begin()

" Linting (COC Related)
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier']

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
  Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
  Plug 'neomake/neomake', { 'on': 'Neomake' }

" Color Schemes
  Plug 'dikiaap/minimalist'
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
  Plug 'ruanyl/vim-fixmyjs'
  Plug 'mxw/vim-jsx'
  Plug 'pangloss/vim-javascript'
  Plug 'tyrannicaltoucan/vim-quantum'
`
" Typescript 
  Plug 'Shougo/vimproc.vim', { 'do': 'make' }
  Plug 'Quramy/tsuquyomi'
  Plug 'leafgarland/typescript-vim'
  Plug 'ianks/vim-tsx'
  Plug 'mhartington/deoplete-typescript'

" File Management & Search
  Plug 'kien/ctrlp.vim'
  Plug 'dyng/ctrlsf.vim'

" Folding & Viewability
  Plug 'tmhedberg/SimpylFold'

" Indentation
  Plug 'vim-scripts/indentpython.vim'

"  Linting
  Plug 'w0rp/ale'

  " Syntax
  Plug 'nvie/vim-flake8'
call plug#end()

" File Types: Completion Support
au BufWritePre *.js :Fixmyjs
au BufWritePre *.jsx :Fixmyjs
au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx

let g:ale_fixers = {
      \ 'javascript': ['eslint']
      \ }

let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_fix_on_save = 1

" File Search
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard'] " Hide objects in .gitignore
let g:ctrlp_show_hidden = 1

set cursorline " Highlight Cursor Line
set hls " Highlight Search Match
set is " Highlight on search.
set colorcolumn=180
set nu relative
set breakindent
set autoindent
set tabstop=2 shiftwidth=2 expandtab softtabstop=2 
set nowritebackup
set noswapfile
set nobackup

" Snippets
let g:UltiSnipsSnippetDirectories=[$HOME.'/.neovim/snippetdata']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<tab>"

" Short-cuts
noremap <C-J> <C-W><C-J>
noremap <C-K> <C-W><C-K>
noremap <C-L> <C-W><C-L>
noremap <C-H> <C-W><C-H>
nmap     <C-F>f <Plug>CtrlSFPrompt                  
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
inoremap <C-c> <Esc>
noremap Y "*y

" Deoplete
set g:deoplete#enable_at_startup = 1
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

call deoplete#custom#set('_', 'matchers', ['matcher_full_fuzzy'])

" Tern
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
syntax on " enable highlighting
set number " enable line numbers

set backspace=indent,eol,start " let backspace delete over lines
set autoindent " enable auto indentation of lines
set smartindent " allow vim to best-effort guess the indentation
" set indent for 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Visual: Default Scheme
if has('gui_running')
	set background=dark
	colorscheme Monosvkem
else
	colorscheme Monosvkem
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

" iTerm2 Tab Name Reporting
if $TERM_PROGRAM =~ "iTerm"
  " Set the title of the Terminal to the currently open file
  function! SetTerminalTitle()
      let titleString = expand('%:t')
      if len(titleString) > 0
          let &titlestring = expand('%:t')
          " this is the format iTerm2 expects when setting the window title
          let args = "\033]1;".&titlestring."\007"
          let cmd = 'silent !echo -e "'.args.'"'
          execute cmd
          redraw!
      endif
  endfunction
autocmd BufEnter * call SetTerminalTitle()
endif
