if exists('g:loaded_minpac')
  " Minpac is loaded.
  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  " Other plugins

  call minpac#add('preservim/nerdtree')
  call minpac#add('tpope/vim-eunuch')
  call minpac#add('skywind3000/asyncrun.vim')
  call minpac#add('nathanaelkane/vim-indent-guides')
  call minpac#add('majutsushi/tagbar')
  call minpac#add('tpope/vim-surround')
  call minpac#add('tpope/vim-repeat')
  call minpac#add('tpope/vim-eunuch')
  call minpac#add('mbbill/undotree')
  call minpac#add('junegunn/fzf', {'do': {-> fzf#install()}})
  call minpac#add('junegunn/fzf.vim')
  call minpac#add('tpope/vim-fugitive')
  call minpac#add('airblade/vim-gitgutter')
  call minpac#add('vim-airline/vim-airline')
  call minpac#add('preservim/nerdcommenter')
  call minpac#add('mg979/vim-visual-multi')
  call minpac#add('uguu-org/vim-matrix-screensaver')
  call minpac#add('fatih/vim-go', { 'do': {-> GoUpdateBinaries()}})
  call minpac#add('fatih/vim-go')
  call minpac#add('hzchirs/vim-material')
  call minpac#add('plasticboy/vim-markdown')
  call minpac#add('iamcco/markdown-preview.nvim', {'do': 'packloadall! | call mkdp#util#install()'})
  call minpac#add('frazrepo/vim-rainbow')
  call minpac#add('rust-lang/rust.vim')
  call minpac#add('neoclide/coc.nvim', {'branch': 'release'})
  " call minpac#add('ycm-core/YouCompleteMe')

" To install or update plugins: :PackUpdate
" call minpac#update()

" To uninstall unused plugins:
" call minpac#clean()

" To see plugins status:
" call minpac#status()

endif

if has('eval')
  " Minpac commands
  command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update('', {'do': 'call minpac#status()'})
  command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
  command! PackStatus packadd minpac | source $MYVIMRC | call minpac#status()
endif

" Theme
set background=dark
colorscheme vim-material

" rainbow
let g:rainbow_active = 1
" 命令行高度设为2
set cmdheight=2
" 允许未保存的修改切换缓冲区
set hidden
" 自动切换当前目录
set autochdir
" 无备份
set nobackup
" 无交换文件
set noswapfile
" 显示括号配对
set showmatch
" 禁止自动折叠
set foldlevel=100

set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt = 0

" 光标样式
if exists('$TMUX')
  " tmux
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  " iTerm2
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_SR = "\<Esc>]50;CursorShape=2\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" leader 键
" let mapleader=","
let mapleader="\<space>"

" 文件类型设置
au FileType c,cpp,objc,go  setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=4 cinoptions=:0,g0,(0,w1
au FileType json        setlocal expandtab shiftwidth=2 softtabstop=2
au FileType vim         setlocal expandtab shiftwidth=2 softtabstop=2
au FileType help  nnoremap <buffer> q <C-W>c

" 加入记录系统头文件的标签文件和上层的 tags 文件
set tags=./tags;,tags,/usr/local/etc/systags

" 和 asyncrun 一起用的异步 make 命令
command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>

" 异步运行命令时打开 quickfix 窗口，高度为 10 行
let g:asyncrun_open = 10

" let g:indent_guides_enable_on_vim_startup = 1

" 语法高亮
syntax on
" 开关 Tagbar 插件的键映射
nnoremap <F9>      :TagbarToggle<CR>
inoremap <F9> <C-O>:TagbarToggle<CR>

" 真彩显示
if has('termguicolors') &&
      \($COLORTERM == 'truecolor' || $COLORTERM == '24bit')
  set termguicolors
endif

" 补全
inoremap ' ''<ESC>i
inoremap " ""<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
" inoremap { {<CR>}<ESC>O
" inoremap ; <ESC>A;

nnoremap H ^
nnoremap L $ {}
inoremap <expr><CR> expand("<cword>") == "{}" ? '<CR><ESC>O':'<CR>'
inoremap <expr><BS> getline(".") =~ '^\s\+$' ? '<ESC>ddkA':'<BS>'

nnoremap <Leader>fi :YcmCompleter FixIt<CR>
nnoremap <Leader>gt :YcmCompleter GoTo<CR>
nnoremap <Leader>gd :YcmCompleter GoToDefinition<CR>
nnoremap <Leader>gh :YcmCompleter GoToDeclaration<CR>
nnoremap <Leader>gr :YcmCompleter GoToReferences<CR>

let g:ycm_auto_hover = ''
let g:ycm_complete_in_comments = 1
let g:ycm_filetype_whitelist = {
      \ 'c': 1,
      \ 'cpp': 1,
      \ 'python': 1,
      \ 'vim': 1,
      \ 'go': 1,
      \ 'java': 1,
      \ 'json': 1,
      \ 'rs': 1,
      \ 'toml': 1,
      \ 'sql': 1,
      \ 'sh': 1,
      \ 'zsh': 1,
      \ }
let g:ycm_goto_buffer_command = 'split-or-existing-window'
let g:ycm_key_invoke_completion = '<C-Z>'

" 分屏竖线格式
" hi VertSplit     term=reverse cterm=reverse guifg=#263238 guibg=#000000
hi VertSplit     term=reverse cterm=reverse guifg=#000000 guibg=#000000


" 解决删除键失效
set backspace=2

" airline 配置
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#overflow_marker = '…'
let g:airline#extensions#tabline#show_tab_nr = 0

" go 配置
filetype plugin indent on

set number
set autowrite

" Go syntax highlighting
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1

" Status line types/signatures
let g:go_auto_type_info = 1
" Run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction
" Map keys for most used commands.
" Ex: `\b` for building, `\r` for running and `\b` for running test.
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
set ts=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
" au filetype go inoremap <buffer> . .<C-x><C-o>
" go 配置 end
" NERDTree 在右边
" let g:NERDTreeWinPos = "Left"
autocmd vimenter * NERDTree
wincmd w
autocmd VimEnter * wincmd w
map <leader>1 :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | end    if
" Rust
let g:rustfmt_autosave = 1
" let g:ycm_rust_src_path = '/Users/huanghaote/.rustup/toolchains/nightly-x86_64-apple-darwin/lib/r    ustlib/src/rust/src'
inoremap <leader>; <C-x><C-o>
" let g:ycm_rust_src_path = '/usr/local/rust/rustc-
nnoremap <Leader>] :YcmCompleter GoTo<CR>
" 记住上次编辑的地方
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|e    ndif|endif
set scrolloff=10

