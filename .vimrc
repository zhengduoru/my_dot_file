set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,cp936
set guifont=Consolas:h15
" language messages zh_CN.utf-8
" set number
set autoindent
set smartindent
set expandtab
set tabstop=4
set autochdir
set hlsearch
set noswapfile
set backspace=2
set shiftwidth=4
set foldmethod=manual
syntax enable
colorscheme monokai
set nobackup
set relativenumber

" ####################################################################################
" 修改切屏快捷键为分号
:nnoremap ; <c-w>
" buffer 设置
" 避免必须保存修改才可以跳转buffer
set hidden
" buffer之间的移动
nmap <c-h> :bp<CR>
nmap <c-l> :bn<CR>
" 删除buffer
nmap <c-x> :bd<CR>
nmap <c-q> :q<CR>
nmap <c-w> :w<CR>

nmap <F3> :set invrelativenumber<CR>
set pastetoggle=<F10>
nmap <F9> :%!sqlformat -a --keywords upper --identifiers lower -<CR>

" #######下面是插件设置
" ####################################################################################
"Plugin manager
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/bundle')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Valloric/YouCompleteMe', { 'do' : './install.py' }
Plug 'roxma/vim-paste-easy'
call plug#end()
" PlugInstall [name ...] [#threads]	Install plugins
" PlugUpdate [name ...] [#threads]	Install or update plugins
" PlugClean[!]	Remove unused directories (bang version will clean without
" prompt)
" PlugUpgrade	Upgrade vim-plug itself
" PlugStatus	Check the status of plugins
" PlugDiff	Examine changes from the previous update and the pending changes
" PlugSnapshot[!] [output path]	Generate script for restoring the current snapshot of the plugins

" ####################################################################################
" NERDTree的快捷键修改
map <C-n> :NERDTreeToggle<CR>

" ####################################################################################
" airline的配置
let g:airline_theme="luna"
let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '>'

" ####################################################################################
" CtrlP的配置
" the nearest ancestor that contains one of these directories or files: .git .hg .svn .bzr _darcs
let g:ctrlp_working_path_mode = 'ra'
" 忽略后缀为以下类型的文件
" set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
"If a file is already open, open it again in a new pane instead of switching to the existing pane
let g:ctrlp_switch_buffer = 'et'

" ####################################################################################
" YouCompleteMe
" 函数排版不跳出
set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt = 0
" 颜色
highlight PMenu ctermfg=0 ctermbg=3 guifg=black guibg=darkgrey
highlight PMenuSel ctermfg=3 ctermbg=0 guifg=darkgrey guibg=black
" 诊断信息
" let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
" 输入两个字符后开始补全
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
" 补全快捷键
let g:ycm_key_invoke_completion = '<c-z>'
nnoremap <C-i> :YcmCompleter GoToDefinitionElseDeclaration<CR>
" 系统python路径
let g:ycm_python_interpreter_path = ''
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/global_extra_conf.py'
