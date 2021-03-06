" >^.^<
" 插件
call plug#begin('~/.vim/plugged')
Plug 'kyazdani42/nvim-web-devicons'
Plug 'projekt0n/github-nvim-theme'
Plug 'morhetz/gruvbox'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'dracula/vim', {'as': 'dracula'}
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'brach': 'release'}
Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'liuchengxu/vista.vim'
Plug 'mhinz/vim-startify'
Plug 'lervag/vimtex'
Plug 'kshenoy/vim-signature'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'akinsho/toggleterm.nvim', { 'tag' : 'v1.*' }
Plug 'tpope/vim-obsession'
Plug 'Vimjas/vim-python-pep8-indent'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'ryanoasis/vim-devicons'
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
" Plug 'lambdalisue/glyph-palette.vim'
" Plug 'liuchengxu/eleline.vim'
call plug#end()


" ==============================================================================
" = normal option
" ==============================================================================

" syntax enable
set background=dark
set termguicolors
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" ==============================================================================
" = for theme
" = use gruvbox: add this to change signcolumn color
" = let g:gruvbox_contrast_dark='medium'
" = let g:gruvbox_sign_column='bg0'
" =
" = github_dark_default, github_light
" ==============================================================================
let g:github_function_style = "italic"
let g:github_sidebars = ["qf", "terminal", "packer", "coc-explorer", "vista_markdown", "vista"]

" Change the "hint" color to the "orange" color, and make the "error" color bright red
let g:github_colors = {
      \ 'hint': 'orange',
      \ 'error': '#ff0000'
      \ }
let g:gruvbox_contrast_dark="soft"
let g:gruvbox_sign_column='bg0'
colorscheme github_dark

" hi Normal guibg=NONE ctermbg=NONE

" set t_Co=256
set number
" set colorcolumn=80
" set relativenumber
set wrap
set smartindent
set autoindent
set showcmd
set encoding=utf-8
set cursorline
set laststatus=3
" set winbar=%f
" new feature, first test on internet in 2022/5/20.
" so, can not use at present.
set ruler
set nobackup
set noswapfile
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set wildmenu
set hlsearch
set mouse=a
set completeopt=longest,noinsert,menuone,noselect,preview
set viewoptions=cursor,folds,slash,unix
set path+=**  " for :find command, this make if search at current path and subpath.
set splitright
set splitbelow
set virtualedit=block
set signcolumn=yes
set foldmethod=manual
let mapleader=" "

" make vimscript indent 2
autocmd FileType vim set shiftwidth=2 tabstop=2 softtabstop=2

" ==============================================================================
" = for file brosing by vim
" = find key maps in: netrw-browse-maps 
" = this is some key maps which usually will be use.
" = a    - toggle show some hidden file.
" = I    - toggle the displaying of the banner.
" = d    - make a directory.
" = %    - make a new file in current path.
" = D    - remove the file/directory.
" = R    - rename the file/directory.
" = v    - open file in vertical split.
" = o    - open file in horizontal split.
" = <cr> - open file in horizontal split, or just open a directory.
" ==============================================================================

let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

"set cursor shape in iterm2
au VimEnter,VimResume * set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
au VimLeave,VimSuspend * set guicursor=a:blinkon0


filetype indent on

nnoremap <leader>n :CocCommand explorer<cr>
nnoremap <leader>F :Ranger<cr>

nnoremap [b :bp<cr>
nnoremap ]b :bn<cr>

nnoremap [t gT
nnoremap ]t gt

nnoremap ma mA
nnoremap ms mS
nnoremap md mD
nnoremap 'a 'A
nnoremap 's 'S
nnoremap 'd 'D

nnoremap <c-n> :nohl<cr>
nnoremap <c-j> 5j
nnoremap <c-k> 5k
nnoremap <c-h> 5h
nnoremap <c-l> 5l
vnoremap <c-j> 5j
vnoremap <c-k> 5k
vnoremap <c-h> 5h
vnoremap <c-l> 5l

" return to normal model on terminal model
" tnoremap <Esc> <C-\><C-n>

" ==============================================================================
" = run code
" = '%' denote the current file full path.
" = if want show how much time cost after run code
" = add 'time' command, use python script as example
" = execute '!time python %' or `term time python %`
" ==============================================================================

function MyRunFunc()
  if &filetype == 'python'
    set splitbelow
    :sp
    :term python3 %
  elseif &filetype == 'java'
    set splitbelow
    :sp
    :res -5 " resize the window, down 5 line.
    :term javac % && time java %<
  endif
endfunction

nnoremap <F5> :call MyRunFunc()<cr>
command! Mr call MyRunFunc()

set clipboard=unnamed
set gcr=a:blinkon0

highlight clear CursorLineNr
highlight CursorLineNr term=bold ctermfg=214 guifg=#fabd2f

" ==============================================================================
" = own statusline and tabline
" = diagnostic.errorSign": "\uf467",
" = diagnostic.warningSign": "\uf071",
" = diagnostic.infoSign": "\uf129",
" = diagnostic.hintSign": "\uf864",
"
" = for coc info: use b:coc_diagnostic_info
" = {'error': 0, 'warning': 0, 'information': 0, 'hint':0}`
" =   ﱤ ﱴ    
" ==============================================================================

function! StatusDiagnostic() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif
  let msgs = []
  if get(info, 'error', 0)
    call add(msgs, 'E' . info['error'])
  else
    call add(msgs, 'E' . '0')
  endif

  if get(info, 'warning', 0)
    call add(msgs, 'W' . info['warning'])
  else
    call add(msgs, 'W' . '0')
  endif

  if get(info, 'hint', 0)
    call add(msgs, 'H' . info['hint'])
  else
    call add(msgs, 'H' . '0')
  endif
  return join(msgs, ' '). ' ' . get(g:, 'coc_status', '')
endfunction

function! MyGitStatus() abort
  let myHead = FugitiveStatusline()
  if empty(myHead)
    return ''
  endif

  let [a,m,r] = GitGutterGetHunkSummary()

  return " " . myHead . printf(' +%d ~%d -%d', a, m, r)
endfunction

function! MyFileEncode() abort
  if &fileencoding == ""
    if &encoding != ""
      return toupper(&encoding)
    else
      return "NONE"
    endif
  else
    return toupper(&fileencoding)
  endif
endfunction

set statusline=
set statusline+=\ %f
" set statusline+=\ %m
set statusline+=\ %{MyGitStatus()}
set statusline+=\ %{get(b:,'coc_current_function','')}
set statusline+=\%= " separator
set statusline+=\ %{ObsessionStatus()}
set statusline+=\ %{StatusDiagnostic()}
set statusline+=\ %{MyFileEncode()}
set statusline+=\ %Y
set statusline+=\ %l:\%v
set statusline+=\ 



" ==============================================================================
" = vim-airline
" ==============================================================================

let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
" let g:airline_symbols.linenr=''
" " need other plug(vim-fugitive) to show branch symbol.
let g:airline_symbols.branch=''
let g:airline_symbols.readonly="\ue0a2"

" change the status line symbol
"            
" let g:airline_left_sep = '▏'
" let g:airline_left_alt_sep = '▏'
" let g:airline_right_alt_sep = '▏'
" let g:airline_right_sep = '▏'

let g:airline#extensions#tabline#buffer_nr_show=1
let g:airline#extensions#tabline#formatter = 'unique_tail'
" let g:airline_theme='dracula'
" show the number of change / delete / add
" let g:airline#extensions#hunks#enabled=1
" show the branch symbol
" let g:airline#extensions#branch#enabled=1


" ==============================================================================
" = vim-markdown
" ==============================================================================

"取消markdown的折叠
let g:vim_markdown_folding_disabled=0

" syntax conceal
set conceallevel=0
" latex math
let g:vim_markdown_math = 1
" yaml front matter
let g:vim_markdown_frontmatter = 1
" strikethrough
let g:vim_markdown_strikethrough = 1
highlight htmlBold gui=bold guifg=#fe8019
highlight htmlItalic gui=bold guifg=#458588
highlight htmlLink guifg=#83a598 cterm=underline gui=underline



" ==============================================================================
" = coc.nvim
" ==============================================================================

set hidden
set updatetime=100
set shortmess+=c

"使用tab来出发代码补全，前面有字符的情况
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" open complication bar again
" inoremap <silent><expr> <c-space> coc#refresh()

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"上下错误跳转
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gI <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

"同名变量高亮
autocmd CursorHold * silent call CocActionAsync('highlight')
" highlight CocHighlightText guibg=#fe8019 ctermbg=208

"rename elements
nmap <leader>rn <Plug>(coc-rename)
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
nmap <leader>cl  <Plug>(coc-codelens-action)
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)
command! -nargs=0 Format :call CocActionAsync('format')
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')
" set for statusline ?
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

let g:coc_global_extensions = [
      \ 'coc-vimlsp',
      \ 'coc-snippets',
      \ 'coc-pyright',
      \ 'coc-json',
      \ 'coc-java',
      \ 'coc-explorer',
      \ 'coc-pairs',
      \ 'coc-highlight']

imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-e> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<c-e>'
" let g:coc_snippet_prev = '<c-l>'
imap <C-e> <Plug>(coc-snippets-expand-jump)


" ==============================================================================
" = vim-gitgutter
" = ▏
" ==============================================================================

let g:gitgutter_sign_allow_clobber = 0
let g:gitgutter_set_sign_backgrounds = 1
let g:gitgutter_map_keys = 0
let g:gitgutter_preview_win_floating = 1
let g:gitgutter_sign_added = '▎'
let g:gitgutter_sign_modified = '░'
let g:gitgutter_sign_removed = '▎'
let g:gitgutter_sign_removed_first_line = '▔'
let g:gitgutter_sign_modified_removed = '▒'
highlight GitGutterAdd    guifg=#8ec07c ctermfg=108
highlight GitGutterChange guifg=#fabd2f ctermfg=214
highlight GitGutterDelete guifg=#cc241d ctermfg=124


" ==============================================================================
" = vista
" ==============================================================================

" function! NearestMethodOrFunction() abort
"   return get(b:, 'vista_nearest_method_or_function', '')
" endfunction
" set statusline+=%{NearestMethodOrFunction()}
" autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
noremap <LEADER>v :Vista!!<CR>
noremap <c-t> :silent! Vista finder coc<CR>
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'coc'
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
      \   "function": "\uf794",
      \   "variable": "\uf71b",
      \  }


" ==============================================================================
" = fzf.vim
" ==============================================================================

" let g:fzf_preview_window = 'right:60%'
" using :Files to open fzf windows


" ==============================================================================
" = coc-explorer
" ==============================================================================

" nmap <leader>e :CocCommand explorer<CR>
" nmap <leader>f :CocCommand explorer --preset floating<CR>
" if just remain coc-explorer in the buffer, close nvim.
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif


" ==============================================================================
" = glyph
" ==============================================================================

" let g:glyph_palette#palette='GlyphPalette1'
" augroup my-glyph-palette
"   autocmd! *
"   autocmd FileType fern,nerdtree,startify,coc-explorer call glyph_palette#apply()
" augroup END



" ==============================================================================
" = vimtext: for latex
" ==============================================================================

filetype plugin indent on

" let g:vimtex_view_method = 'zathura'
" let g:vimtex_view_general_viewer = 'okular'
" let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
" let g:vimtex_compiler_method = 'latexrun'

let g:tex_flavor = 'xelatex'

" close auto open error window, use :copen to open error window
let g:vimtex_quickfix_mode = 0
let g:vimtex_view_method='skim'
let g:vimtex_view_skim_sync = 1
let g:vimtex_view_skim_activate = 1
" use this commentray to set the compile version
" % !TEX program = xelatex
" put the commentray above on the top of tex file


" ==============================================================================
" = vim-signature: show marks in signcolumn
" ==============================================================================


" ==============================================================================
" = easymotion
" = make some seting for nvim got some error when using this plug with coc.nvim
" ==============================================================================

autocmd User EasyMotionPromptBegin silent! CocDisable
autocmd User EasyMotionPromptEnd silent! CocEnable
nmap f <Plug>(easymotion-s)

" ==============================================================================
" = vim-markdown-preview
" ==============================================================================

" let g:mkdp_browser = 'chrome'


" ==============================================================================
" = bufferline
" ==============================================================================

lua << EOF
require("bufferline").setup{
options = {
  mode = "buffers",
  numbers = "ordinal",
  diagnostic = "coc",
  color_icons = true,
  always_show_bufferline = true,
  offsets = {
    {
        filetype = "coc-explorer",
        text = "Coc Explorer",
        highlight = "Directory",
        text_align = "left"
    }
    }
  }
}
EOF

" link to Statusline
" gruvbox
" highlight BufferLineFill cterm=reverse ctermfg=239 ctermbg=223 
" highlight BufferLineFill gui=reverse guifg=#504945 guibg=#ebdbb2

" github_dark
highlight BufferLineFill guibg=#24292e

" nnoremap <silent>[b :BufferLineCycleNext<CR>
" nnoremap <silent>b] :BufferLineCyclePrev<CR>

" ==============================================================================
" = telescope: a fuzzy finder
" ==============================================================================
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" ==============================================================================
" = treesitter
" = A syntax highlight plug.
" = need use TSInstall LANGUAGE_NAME to install highlight.
" = for python example: TSInstall python
" ==============================================================================

lua << EOF
require('nvim-treesitter.configs').setup{
highlight = {
  enable = true,
  additional_vim_regex_highlighting = false,
  }
}
EOF

" ==============================================================================
" = toggleterm
" ==============================================================================
lua << EOF
require("toggleterm").setup{
size = 20,
open_mapping = [[<c-\>]],
direction = 'float',
close_on_exit = true,
}
EOF
function! Mterm() abort
  :ToggleTerm direction=horizontal
endfunction
command! Mterm call Mterm()

" ==============================================================================
" = vim-obsession
" = a plugin to save vim/neovim session.
" = use :Obsession {dir} to start write a session file in {dir}
" = like IDE pycharm, recommend {dir} equal to ./.vimsession
" = using %{ObsessionStatus()} to show info in statusline
" ==============================================================================

