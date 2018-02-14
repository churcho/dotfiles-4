

"    ___  __________     __          _
"   / _ \/ ___/ ___/__ _/ /__ __  __(_)__
"  / ___/ (_ / (_ / _ `/ / _ `/ |/ / /_ /
" /_/   \___/\___/\_,_/_/\_,_/|___/_//__/


scriptencoding utf-8
set encoding=utf-8

" Use full Vim features
set nocompatible

" Config file path
let g:config_path = "~/.config/nvim/"

" Function for sourcing config modules
function! ConfigInc(module)
    execute 'source ' . fnameescape(g:config_path) . fnameescape(a:module)
endfunction

" Python 3 is needed for some plugins to work
let g:python3_host_prog = '/usr/local/bin/python3'

set termguicolors
" I like block & always blinking cursor
set guicursor=a:block-blinkwait100-blinkoff150-blinkon175

" -------------------------------------------------------------------------------------------
"  SETTINGS
" -------------------------------------------------------------------------------------------

call ConfigInc('settings.vim')

" -------------------------------------------------------------------------------------------
"  AUTOCOMMANDS
" -------------------------------------------------------------------------------------------

call ConfigInc('autocmds.vim')

" -------------------------------------------------------------------------------------------
"  PLUGINS
" -------------------------------------------------------------------------------------------

call ConfigInc('plugins.vim')

" Map vim-plug most used functions
nnoremap <localleader>pu :PlugUpdate<cr>
nnoremap <localleader>pc :PlugClean<cr>
nnoremap <localleader>pi :PlugInstall<cr>

" *******************************************************************
" Plugins with many lines of configuration are under 'plugins' folder
" *******************************************************************

" elzr/vim-json
" ==================================
let g:vim_json_syntax_conceal = 0

" posva/vim-vue
" ==================================
let g:vue_disable_pre_processors = 1

" slashmili/alchemist.vim
" ==================================
let g:alchemist_tag_disable = 1 "Use Universal ctags instead
let g:alchemist_mappings_disable = 1

" ditmammoth/doorboy.vim
" ==================================
" Easy jump closings without leaving home row or insert mode
inoremap ii <esc>la

" mattn/emmet-vim
" ==================================
let g:user_emmet_mode='a'
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key='º' " Hack gor using 1 key as leader
autocmd FileType html,css,scss,vue,jsx,javascript,javascript.jsx
            \ EmmetInstall
            \ | imap <buffer> <C-Return> <Plug>(emmet-expand-abbr)

" junegunn/vim-easy-align
" ==================================
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Yggdroot/indentLine
" ==================================
let g:indentLine_setColors = 0
let g:indentLine_char = '┆'
let g:indentLine_color_gui = '#65737e'

" AndrewRadev/splitjoin.vim
" ==================================
let g:splitjoin_split_mapping = ''
let g:splitjoin_join_mapping = ''
nmap <localleader>j :SplitjoinSplit<CR>
nmap <localleader>k :SplitjoinJoin<CR>

" airblade/vim-gitgutter
" ==================================
let g:gitgutter_map_keys = 0
nmap <leader>g <Plug>GitGutterNextHunk
nmap <leader>G <Plug>GitGutterPrevHunk

" scrooloose/nerdtree
" ==================================
map <leader>n :NERDTreeToggle<cr>
map <leader>b :NERDTreeFind<cr>
let g:NERDTreeShowHidden = 1
let g:NERDTreeCascadeOpenSingleChildDir = 1
let g:NERDTreeQuitOnOpen = 1

" lotabout/skim
" ==================================
nnoremap <C-s> :<C-u>SK --color=selected:238,current_match:214<cr>

" AndrewRadev/switch.vim
" ==================================
let g:switch_mapping = ""
noremap <leader>s :Switch<cr>

" christoomey/vim-tmux-navigator
" ==================================
let g:tmux_navigator_no_mappings = 1
noremap <silent> <C-h> :TmuxNavigateLeft<cr>
noremap <silent> <C-j> :TmuxNavigateDown<cr>
noremap <silent> <C-k> :TmuxNavigateUp<cr>
noremap <silent> <C-l> :TmuxNavigateRight<cr>
noremap <silent> <C-p> :TmuxNavigatePrevious<cr>

" hauleth/sad.vim
" ==================================
nmap <leader>c <Plug>(sad-change-forward)
vmap <leader>c <Plug>(sad-change-forward)
nmap <leader>C <Plug>(sad-change-backward)
vmap <leader>C <Plug>(sad-change-backward)

" matze/vim-move
" ==================================
" Using a hack here, this rare signs are equal as pressing <ALT-j> and <ALT-k>
" Don't know why alt key is not working without this weird mappings
nmap ¶ <Plug>MoveLineDown
vmap ¶ <Plug>MoveBlockDown
nmap § <Plug>MoveLineUp
vmap § <Plug>MoveBlockUp

" rizzatti/dash.vim
" ==================================
nmap <silent> <C-d> <Plug>DashSearch

" airblade/vim-rooter
" ==================================
nnoremap <localleader>cd :Rooter<cr>
let g:rooter_patterns = ['Makefile', 'mix.exs', 'package.json', '*.yml', '*.yaml', '.git', '.git/', 'node_modules/', '.hg/', '.gitignore']
let g:rooter_change_directory_for_non_project_files = 'current'

" carlitux/deoplete-ternjs
" ==================================
let g:tern_show_signature_in_pum = 1
let g:deoplete#sources#ternjs#timeout = 1
let g:deoplete#sources#ternjs#types = 1
let g:deoplete#sources#ternjs#docs = 1
let g:deoplete#sources#ternjs#filetypes = [
  \ 'js',
  \ 'javascript',
  \ 'vue',
  \ 'jsx',
  \ 'javascript.jsx'
\ ]

" zchee/deoplete-go
" ==================================
let g:deoplete#sources#go#gocode_binary = $GOPATH . '/bin/gocode'

" racer-rust/vim-racer
" ==================================
let g:racer_cmd = '~/.cargo/bin/racer'
let g:racer_experimental_completer = 1

" wellle/tmux-complete.vim
" ==================================
let g:tmuxcomplete#trigger = ''

" Shougo/neosnippet
" ==================================
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" Shougo/echodoc.vim
" ==================================
let g:echodoc#enable_at_startup = 1

" vim-airline/vim-airline
" ==================================
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_nr_format = '%s '
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_powerline_fonts = 1
let g:airline_enable_branch = 1
let g:airline_branch_prefix = '⎇ '
let g:airline_skip_empty_sections = 1
" let g:airline_theme='oceanicnext'
let g:airline#extensions#ale#enabled = 1

" -------------------------------------------------------------------------------------------
"  FUNCTIONS
" -------------------------------------------------------------------------------------------

call ConfigInc('functions.vim')

"----------------------------------------------------------------------------------------------
" KEYBINDINGS
"----------------------------------------------------------------------------------------------

call ConfigInc('keybindings.vim')

"----------------------------------------------------------------------------------------------
" THEMES / COLORS / UI
"----------------------------------------------------------------------------------------------

" If colorscheme = OceanicNext
" colorscheme OceanicNext
" highlight CursorLineNr guifg=#fac863

" If colorscheme = nova
colorscheme nova
highlight CursorLineNr guifg=#f2c38f
