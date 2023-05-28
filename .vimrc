filetype plugin indent on 
set encoding=utf-8 
set nocompatible 
syntax enable 
"Tab replace 4 spaces
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
let mapleader = " "

let t:is_transparent = 1
function! Toggle_transparent_background()
  if t:is_transparent == 0
    hi Normal guibg=#282828 ctermbg=black
    let t:is_transparent = 1
  else
    hi Normal guibg=NONE ctermbg=NONE
    let t:is_transparent = 0
  endif
endfunction
nnoremap <leader>b :call Toggle_transparent_background()<CR>

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
set shortmess+=c
set cmdheight=2

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
" if has("patch-8.1.1564")
"   " Recently vim can merge signcolumn and number column into one
"   set signcolumn=number
" else
"   set signcolumn=yes
" endif

nnoremap <silent> K :call ShowDocumentation()<CR>
" Show hover when provider exists, fallback to vim's builtin behavior.
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('definitionHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

nmap <leader>fi  :CocFix<CR>
nmap <leader>di  :CocDiagnostics<CR>
nmap <leader>a   :CocAction<CR>
vmap <leader>a   :CocAction<CR>
au BufRead,BufNewFile *.S set filetype=gas

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden


" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Command-line completion operates in an enhanced mode
set wildmenu
set wildmode=list:longest,full

" Vertical splits split right
set splitright

" Splits split below
set splitbelow

" Substitute a highlighted word (h/t Vidal Ekechukwu)
vnoremap <c-r> "hy:%s/<c-r>h//gc<left><left><left>

" Enable mouse support. You should avoid relying on this too much, but it can
" sometimes be convenient.
set mouse+=a

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start

" No --INSERT--
set noshowmode

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'octol/vim-cpp-enhanced-highlight'
" Plug 'Valloric/YouCompleteMe'
" Plug 'Valloric/MatchTagAlways'
Plug 'preservim/nerdtree'
" Plug 'neomake/neomake'
Plug 'lervag/vimtex'
Plug 'sirver/ultisnips'
" Plug 'jiangmiao/auto-pairs'
" Plug 'tpope/vim-surround'
" Plug 'scrooloose/syntastic'
Plug 'tpope/vim-commentary'
" Plug 'tpope/vim-repeat'
" Plug 'kana/vim-submode'
" Plug 'ayu-theme/ayu-vim'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'bkad/CamelCaseMotion'
" Plug 'dense-analysis/ale' "Code analysis
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'mhinz/vim-startify'
" Plug 'tpope/vim-fugitive' " Errors
" Plug 'preservim/tagbar'
" Plug 'jpalardtimeouty/vim-slime'
Plug 'simeji/winresizer'
" Plug 'jremmen/vim-ripgrep'
Plug 'jacoborus/tender.vim'
Plug 'shime/vim-livedown'
Plug 'shirk/vim-gas'
" Plug 'easymotion/vim-easymotion'
Plug 'fatih/vim-go'
call plug#end()

" let g:slime_target = "vimterminal"

"vimtex options
let g:tex_flavor='latex'
"let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=1
let g:vimtex_quickfix_open_on_warning=0
let g:vimtex_quickfix_ignore_filters = ['LaTeX Font Warning']
" set conceallevel=1
" let g:tex_conceal='abdmg'
" hi Conceal ctermbg=none
" let g:vimtex_matchparen_enabled=0
let g:vimtex_delim_stopline=10
let g:vimtex_delim_timeout=10
let g:vimtex_delim_insert_timeout=10

colorscheme tender
" set termguicolors
" let ayucolor="dark"   " for dark version of theme
" colorscheme ayu

nnoremap <leader>md :LivedownToggle<CR>

let g:airline_theme = 'tender'
let g:airline_powerline_fonts = 1 "Включить поддержку Powerline шрифтов
"let g:airline#extensions#keymap#enabled = 0 "Не показывать текущий маппинг
let g:airline_section_z = "\ue0a1:%l/%L Col:%c" "Кастомная графа положения курсора
let g:Powerline_symbols='unicode' "Поддержка unicode

"let g:airline#extensions#xkblayout#enabled = 0
"set guifont=Fura\Code\Light\Nerd\Font\Complete:h16 "Это light версия
"set guioptions= "Отключаем панели прокрутки в GUI
"set showtabline=0 "Отключаем панель табов (окошки FTW)

"number показывает справа номера строк
"relativenumber - нумерацию строк относительно положения курсора
set number relativenumber

"wrap заставляет переносить строчки без их разделения
"Соответсвенно nowrap рендерит строчки за границами экрана
set wrap linebreak nolist "Данная вариация работает как wrap...
"... но переносит строчки не посимвольно, а по словам

set textwidth=80

set cursorline "подсвечивать строку с курсором

set ttimeoutlen=10 "Понижаем задержку ввода escape последовательностей
let &t_SI.="\e[6 q" "SI = режим вставки
let &t_SR.="\e[4 q" "SR = режим замены
let &t_EI.="\e[2 q" "EI = нормальный режим
"Где 1 - это мигающий прямоугольник
"2 - обычный прямоугольник
"3 - мигающее подчёркивание
"4 - просто подчёркивание
"5 - мигающая вертикальная черта
"6 - просто вертикальная черта
"
set keymap=russian-jcukenwin
"Язык ввода при старте Вима - Английский
set iminsert=0
"Аналогично настраивается режим поиска
set imsearch=-1
nnoremap <C-l> a<C-^><Esc>
inoremap <C-l> <C-^>
" let g:cpp_class_scope_highlight = 1
" let g:cpp_member_variable_highlight = 1
" let g:cpp_class_decl_highlight = 1
" let g:cpp_posix_standard = 1
" let g:cpp_experimental_simple_template_highlight = 1
" let g:cpp_concepts_highlight = 1


nmap <leader>t :NERDTreeToggle <CR>

"map <F7> :w <CR> :!cpplint --filter=-,+build/include,-build/include_order,+build/include_what_you_use,+build/storage_class,+readability/alt_tokens,+readability/braces,+readability/casting,+readability/inheritance,+runtime/casting,-runtime/explicit,+whitespace/blank_line,+whitespace/braces,+whitespace/comma,+whitespace/comments,+whitespace/empty_conditional_body,+whitespace/empty_loop_body,+whitespace/end_of_line,+whitespace/ending_newline,+whitespace/forcolon,+whitespace/indent,+whitespace/line_length,+whitespace/newline,+whitespace/operators,+whitespace/parens,+whitespace/semicolon,+whitespace/tab --linelength=100 % <CR>

" map <F9> :!g++ % -o "%".out<CR>
" map <F7> :!./"%".out <CR>
nmap <leader>lt :VimtexCompile <CR>

let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
" nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>

nmap <leader>; :Files<CR>
nmap , :Buffers<CR>

" set termwinsize=5x0

" nmap <leader>tb :TagbarToggle<CR>
" let g:tagbar_autofocus=1
" let g:tagbar_sort=0 "tagbar shows tags in order of they created in file
" let g:tagbar_foldlevel=0 "close tagbar folds by default
" let g:tagbar_ctags_bin="/snap/bin/ctags"

" Copy to clipboard
vmap <leader>c "+y

"Copy the whole file to clipboard
noremap <leader>fc :%y+<CR>

" Past without indent
noremap <leader>v "+p

" Clear search highlighting
nnoremap <nowait><silent> <C-C> :noh<CR>

" nnoremap <silent> <c-p> :exe "resize " . (winheight(0) * 3/2)<CR>
" nnoremap <silent> <c-m> :exe "resize " . (winheight(0) * 2/3)<CR>

" call submode#enter_with('splitsize', 'n', '', '<C-W>+', '<C-W>+')
" call submode#enter_with('splitsize', 'n', '', '<C-W>-', '<C-W>-')
" call submode#leave_with('splitsize', 'n', '', '<Esc>')
" call submode#map('splitsize', 'n', '', '+', '<C-W>+')
" call submode#map('splitsize', 'n', '', '-', '<C-W>-')

" let g:ycm_key_list_select_completion=[]
" let g:ycm_key_list_previous_completion=[]
" let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
" let g:ycm_show_diagnostics_ui = 0
" let g:ycm_filetype_blacklist = {
"       \ 'tagbar': 1,
"       \ 'notes': 1,
"       \ 'markdown': 1,
"       \ 'netrw': 1,
"       \ 'unite': 1,
"       \ 'text': 1,
"       \ 'vimwiki': 1,
"       \ 'pandoc': 1,
"       \ 'infolog': 1,
"       \ 'leaderf': 1,
"       \ 'mail': 1,
"       \ 'tex': 1,
"       \}
" set completeopt-=preview

" call neomake#configure#automake('w')
" let g:neomake_cpp_clang_maker = {
"    \ 'exe': 'clang',
"    \ 'args': ['-I/usr/local/include/wx-3.0', '-std=c11'],
"    \ }
" let g:neomake_tex_enabled_makers = []
