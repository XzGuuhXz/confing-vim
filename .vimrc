" Inicia a definição de plugins usando o gerenciador vim-plug
call plug#begin('~/.vim/plugged')

" --- TEMAS E CORES ---

" Tema Tokyo Night para aparência moderna e com suporte a termguicolors
Plug 'ghifarit53/tokyonight-vim'

" --- LSP --- "

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
Plug 'vim-airline/vim-airline-themes'  " Temas para o vim-airline"

" --- NAVEGAÇÃO ---

"Plugs para navegação de arquivo
Plug 'preservim/nerdtree' 
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'

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

" --- CONFIGURAÇÕES GERAIS ---

set nu!               " Mostra número de linha
set mouse=a           " Ativa uso do mouse no terminal
set title             " Mostra o nome do arquivo na barra de título
set cursorline        " Destaca a linha atual
set encoding=utf-8  " Comentado, mas útil para suportar caracteres UTF-8
set tabstop=2         " Tamanho da tabulação visual (2 espaços)
set shiftwidth=2			" Tamanho da tabulação visual (2 espaços)
set expandtab

" Retorna o cursor para a última posição ao reabrir o arquivo
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

" Cursor como linha (beam) no modo insert
let &t_SI = "\e[6 q"

let g:lsp_settings = {
  \ 'ccls': { 'command': ['ccls'], 'root_markers': ['.ccls-root', 'compile_commands.json'] }
  \ }

