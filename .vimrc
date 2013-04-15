" wm :   打开函数，变量列表
" <F12>: 生成tags文件
" <F8> : 生成cscope索引文件
" <F4> : 日历
" \tt  : 目录树
" \ww  : vimwiki文件
" <F5> : 开启lookupfile的窗口
let Tlist_ShowOne_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_File_Fold_Auto_Close = 1

set hlsearch
syntax on
set noswapfile
set number
set mouse=a
set autoread
set history=700

set t_Co=256
set expandtab
"unenable complete
"set paste

set autoindent
set smartindent

set nowrap
"set sidescroll=10
set modifiable
set whichwrap=b,s
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smarttab
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set scrolloff=8
set ruler
"set expandtab
"set autochdir
set hidden
set smartindent
set cmdheight=1
set laststatus=2
set nocompatible
"set grepprg=find\ .\ -name\ "*.h"\ -o\ -name\ "*.c"\ -o\ -name\ "*.cpp"\ |xargs\ grep\ -nR\ -w\ --color\ --include=*\ --include=*\ $*\
"set grepprg=find\ \.\ -name "*.h"

set grepprg=grep\ -nR\ --exclude=tags\ --exclude-dir=doc\ -w\ --color\ --include=*\ --include=*\ $*\ .
"set grepprg=grep\ -nR\ -w\ --include=*\ --include=*\ $*\ /home/vi/workspace/linux-2.6.32.42/
"set grepprg=grep\ -nR\ -w\ --include=*\ --include=*\ $*\ /mnt/hgfs/workspace/broadpos_dev/
set lbr
set tw=500
set wrap "Wrap lines"
set scrolloff=8
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplMapWindowNavVim=1
let g:miniBufExplorerMoreThanOne=0
let g:miniBufExplModSelTarget=0
"ignore case when do / search
set ignorecase
"close the prev set
"set noignorecase
:colorscheme lilypink
"let g:winManagerWindowLayout='FileExplorer|TagList'
let g:winManagerWindowLayout='TagList'
"let g:AutoComplPop_MappingDriven = 1
nmap wm : WMToggle<cr>
nmap <leader>g :Gtags -s 

set tags=tags
"set tags+=/usr/tags
"set tags+=~/linux-2.6.32.2/linux-2.6.32.2/tags
"set tags+=~/workspace/linux-2.6.32.42/tags
"set tags+=/usr/local/ACE/include/tags
"set tags+=/opt/ACE/ACE_wrappers/tags
"set tags+=/home/vi/workspace/glibc-2.6/tags
"set tags+=/usr/include/tags
"omini
"for close python direction
"set nocp

set ofu=syntaxcomplete#Complete
let g:OmniCpp_NamespaceSearch = 1
let g:OmniCpp_ShowAccess = 1
let g:OmniCpp_GlobalScopeSearch = 1
let g:OmniCpp_ShowPrototypeInAbbr = 1
let g:OmniCpp_MayCompleteDot = 1
let g:OmniCpp_MayCompleteArrow = 1
let g:OmniCpp_MayCompleteScope = 1
let g:OmniCpp_DefaultNamespaces = ["std","_GLIBCXX_STD"]
set completeopt=longest,menu
filetype plugin indent on
filetype plugin on

nnoremap <silent> <F12> :!ctags -R --c-kinds=+p --c++-kinds=+lp --fields=+iaS --fields=+l --extra=+q && lookupfile <CR>
nnoremap <silent> <F9>  :!ctags -R --languages=java
"&& gtags <CR> 

nnoremap <silent> <F8> :!cscope -Rbq <CR>

if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=0
    set cst
    set nocsverb
    if filereadable("cscope.out")
        cs add cscope.out
    elseif $CSCOPE_DB!= ""
        cs add %CSCOPE_DB
    endif
    set csverb
    set cscopetag
    endif

if getfsize("vimscript")>0
    source vimscript 
    endif


map fg : Dox<cr>

"map <F5> : !python %

filetype plugin on
set ofu=syntaxcomplete#Complete
autocmd FileType python　set omnifunc=pythoncomplete#Complete
autocmd FileType python runtime! autoload/pythoncomplete.vim


let g:DoxygenToolkit_autorName="victor.g"
let g:DoxygenToolkit_briefTag_pre = "@brief\t"
let g:DoxygenToolkit_paramTag_pre = "@param\t"
let g:DoxygenToolkit_returnTag = "@return\t"
let g:DoxygenToolkit_briefTag_funcName = "no"
let g:DoxygenToolkit_maxFunctionProtoLines = 30

"python
let g:pydiction_location = '/home/vi/.vim/tools/pydirction/complete-dict'

"vim wiki
map <F4> :Vimwiki2HTML <cr>

let g:vimwiki_list = [{'path': '~/Dropbox/dropboxShare/vimwiki/vimwiki/',
	    \ 'path_html': '~/Dropbox/dropboxShare/vimwiki/vimwiki/html/',
	    \ 'html_header' : '~/Dropbox/dropboxShare/vimwiki/vimwiki/header.tpl'}]

let g:vimwiki_camel_case = 0
let g:vimwiki_valid_html_tags = 'b,i,s,u,sub,sup,kbd,br,hr,div,del,code,red,center,left,right,h4,h5,h6,pre'


"vimgdb
let g:vimgdb_debug_file = ""
"run macros/gdb_mappings.vim
"
map <F4> : Calendar <cr>
"map <F6> : ConqueTerm bash <cr>


"highlight currentline
set cursorline
set cursorcolumn

"nmap <F10> :NERDTreeToggle<cr>
nmap <silent><leader>tt :NERDTreeToggle<cr>
let NERDTreeWinPos='right'

"lookupfile
let g:LookupFile_TagExpr = '"./filenametags"' 
let g:LookupFile_MinPatLength = 2
map <Leader>w <Plug>VimwikiIndex
map <Leader>ff :LookupFile <CR>
map <Leader>fd :LUWalk <CR>
map <Leader>fb :LUBufs <CR>

"copy a word to the sys copy board
map <c-w> "+yaw 
"pase the sys copy board to the txt 
map <c-p> "+p
"copy y
map <c-c> "+y

imap <silent><F6> ++<c-r>=strftime("%x")<cr>
imap <silent><F7> --<c-r>=strftime("%H:%M")<cr> <c-r><cr> 
imap <silent><Leader>a @@@<cr>

"for table operation

"new a table
map tt :tabnew<cr>   
"close the table
map tc :tabc<cr>  
"switch the prev table
map tp :tabp<cr>
"switch the next table
map tn :tabn<cr>
"close all the table beside the one who you are in
map to :tabo<cr>
"show all the tabs opend
map ts :tabs<cr>


"latex-suit
let g:tex_falvor='latex'
set iskeyword+=:
autocmd BUfEnter *.tex set sw=2
