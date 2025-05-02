" Inicia a definição de plugins usando o gerenciador vim-plug
call plug#begin('~/.vim/plugged')

" --- TEMAS E CORES ---

" Tema Tokyo Night para aparência moderna e com suporte a termguicolors
Plug 'ghifarit53/tokyonight-vim'

" --- AUTOCOMPLETAR E LSP ---

"YouCompleteMe: sistema avançado de auto-complete com suporte a LSP
Plug 'ycm-core/YouCompleteMe'

" Insere automaticamente parênteses, colchetes, aspas, etc.
Plug 'jiangmiao/auto-pairs'

" Plugins auxiliares para suporte assíncrono em LSP e auto-complete
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'          " Suporte nativo a LSP
Plug 'mattn/vim-lsp-settings'          " Configura automaticamente servidores LSP

" --- INTERFACE E STATUS ---

" Plugin de barra de status avançada e personalizável
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'  " Temas para o vim-airline

" Encerra a definição dos plugins
call plug#end()


" --- CONFIGURAÇÃO DE TEMA E CORES ---

" Habilita suporte a cores 24 bits (requer terminal compatível)
set termguicolors

" Estilo do tema Tokyo Night: opções 'night', 'storm', etc.
let g:tokyonight_style = 'night'
let g:tokyonight_enable_italic = 1

" Ativa o esquema de cores tokyonight
colorscheme tokyonight

" Destaque para parênteses correspondentes com cor personalizada
hi! MatchParen cterm=NONE,bold gui=NONE,bold guibg=#87c095 guifg=NONE


" --- CONFIGURAÇÕES GERAIS ---

set nu!               " Mostra número de linha
set mouse=a           " Ativa uso do mouse no terminal
set title             " Mostra o nome do arquivo na barra de título
set cursorline        " Destaca a linha atual
set encoding=utf-8  " Comentado, mas útil para suportar caracteres UTF-8
set tabstop=2         " Tamanho da tabulação visual (2 espaços)

" Retorna o cursor para a última posição ao reabrir o arquivo
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

" Ativa dobramento de código baseado em sintaxe (útil em linguagens como Python, C++)
setlocal foldmethod=syntax

" Cursor como linha (beam) no modo insert
let &t_SI = "\e[6 q"

" --- CONFIGURAÇÕES DO YOUCOMPLETEME (YCM) ---

" Remove a janela de preview (popup de autocomplete)
set completeopt-=preview

" Desativa a UI de diagnóstico (mensagens de erro inline)
let g:ycm_show_diagnostics_ui = 0

" Configura o uso do servidor LSP 'ccls' para C/C++
let g:ycm_language_server =
  \ [{
  \   'name': 'ccls',
  \   'cmdline': [ 'ccls' ],
  \   'filetypes': [ 'c', 'cpp', 'cc', 'h', 'hpp' ],
  \   'project_root_files': [ '.ccls-root', 'compile_commands.json' ]
  \ }]


" --- CONFIGURAÇÕES OPCIONAIS DO VIM-AIRLINE (COMENTADAS) ---

" Exemplo de tema para o airline (dracula, se quiser usar)
" let g:airline_theme = 'dracula'

" Ícones bonitos para separar partes da barra de status (requer fonte powerline)
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''

" Personalização de símbolos na barra
" let g:airline_symbols = {}
" let g:airline_symbols.branch = ''
" let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = '☰ '
" let g:airline_symbols.maxlinenr = '  '
" let g:airline_symbols.dirty='⚡'

