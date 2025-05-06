## Guia Completo de Configuração do Vim e Neovim com vim-plug

Este guia descreve os passos necessários para instalar e configurar o **vim ou neovim** todas as dependências e plugins listados no seu arquivo de configuração usando o gerenciador **vim-plug**. Ao final, seu Vim ficará equipado com tema moderno, suporte a LSP, autocompletar avançado e uma barra de status personalizada.

---

## 1. Pré-requisitos

Antes de tudo, instale as dependências básicas em seu sistema **Debian/Ubuntu**:
- **Vim** (versão >= 8.0) ou **Neovim** (recomendado para melhor compatibilidade com LSP).
- **Git**: necessário para clonar os repositórios dos plugins.
- **CMake** e **Python 3-dev / Python-devel (opicional)**:necessario caso queira adiciona mas plugs.
- **ccls** (ou outro servidor LSP de sua preferência) para C/C++.
- **Node.js** (opcional, caso você queira usar outros LSPs baseados em JavaScript).
- **Fonte Powerline ou Nerd Font**: necessária para ícones na barra de status com vim-airline.

---

### Instalando em Debian/Ubuntu:

```bash
sudo apt update
sudo apt install -y vim git curl build-essential ccls nodejs npm cmake python3-dev fonts-powerline fonts-firacode
```  

### Para Neovim, se ainda não estiver instalado:
```bash
sudo apt install -y neovim
```

---

```bash
sudo apt install -y cmake python3-dev 
```

## 2. Instalando o vim-plug

### Vim
```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```  
Este comando baixa o gerenciador de plugins **vim-plug** para Vim 

### Neovim
```bash
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```  
O mesmo passo é aplicado ao Neovim, onde o arquivo de configuração fica em `~/.config/nvim/` 

---

## 3. Definindo os plugins

Adicione no final do seu `~/.vimrc` (Vim) ou `~/.config/nvim/init.vim` (Neovim):

## Como abrir o arquivo de configuração do vim ou neovim:

1. Para vim abra o terminal e digite o seguinte comando:
   ```bash
   vim ~/.vimrc
   ```
2. Para neovim abra o terminal e digite o seguinte comando:
   ```bash
   nvim ~/.config/nvim/init.vim
   ```

```vim
call plug#begin('~/.vim/plugged')

" --- TEMAS E CORES ---
Plug 'ghifarit53/tokyonight-vim'

" --- LSP ---
" Auto-pares para parênteses, aspas etc.
Plug 'jiangmiao/auto-pairs'

" Suporte assíncrono e LSP
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

" --- INTERFACE E STATUS ---
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" --- NAVEGAÇÃO ---
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'

call plug#end()
```  
Exemplo de declaração de plugins com **vim-plug** 

---

## 4. Instalando os plugins


1. Abra o Vim ou Neovim:
   ```bash
   vim ou nvim
   ```
2. Execute no modo comando:
   ```vim
   :PlugInstall
   ```
3. Aguarde a conclusão da instalação.

---

## 5. Configurações no `.vimrc` / `init.vim`

### Tema Tokyo Night
```vim
set termguicolors
let g:tokyonight_style = 'night'
let g:tokyonight_enable_italic = 1
colorscheme tokyonight
```

### Configurações Gerais
```vim
set nu
set mouse=a
set title
set cursorline
set encoding=utf-8
set tabstop=2
set shiftwidth=2
set expandtab
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif
let &t_SI = "\e[6 q"
```

### 6. Configuração dos servidores LSP

O plugin **mattn/vim-lsp-settings** instala automaticamente servidores LSP comuns:

- Ao abrir um arquivo `*.cpp`, `*.py`, etc., o servidor correspondente será baixado.
- Para C/C++, garanta ter o `ccls` instalado no sistema para que o LSP localize o binário.

Você pode ajustar configurações específicas em seu `vimrc`:
```vim
let g:lsp_settings = {
  \ 'ccls': { 'command': ['ccls'], 'root_markers': ['.ccls-root', 'compile_commands.json'] }
  \ }
```
---

### Configuração opcional

---

### Airline
```vim
let g:airline_theme = 'tokyonight'
let g:airline_symbols = {}
let g:airline_symbols.branch   = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr   = '☰ '
let g:airline_symbols.maxlinenr= '  '
let g:airline_symbols.dirty    = '⚡'
```

### NERDTree + Devicons + Git
```vim
" Ativar NerdTree-Git-Plugin e ícones
let g:NERDTreeGitStatusIndicatorMapCustom = {
      \ 'Modified'  :'✹',
      \ 'Staged'    :'✚',
      \ 'Untracked' :'✭',
      \ 'Renamed'   :'➜',
      \ 'Unmerged'  :'═',
      \ 'Deleted'   :'✖',
      \ 'Dirty'     :'✗',
      \ 'Ignored'   :'☒',
      \ 'Clean'     :'✔︎',
      \ 'Unknown'   :'?',
      \ }
```

---

## 7. Instalar dependências extras

- **Python dev**: já instalado em pré-requisitos.
- **ccls** para C/C++: disponível via `sudo apt install ccls`.
- **Node.js / npm**: para scripts JavaScript.
- **Fontes Nerd Font / Powerline**: para ícones no vim-devicons e vim-airline.

---

## 8. Substituindo seu arquivo `.vimrc`

⚠️ **Atenção:** Isso irá sobrescrever seu `.vimrc` atual. Faça um backup, se necessário:
```bash
cp ~/.vimrc ~/.vimrc.backup
```
---

Caso você queira utilizar a configuração completa diretamente:

1. Salve o conteúdo da configuração em um arquivo chamado `.vimrc`:
   ```bash
   cp caminho/do/seu/arquivo_de_configuracao ~/.vimrc
   ```

   Exemplo, caso o arquivo esteja no mesmo local deste guia:
   ```bash
   cp ~/vim-config/seu-vimrc ~/.vimrc
   ```

2. Reinicie o Vim ou Nvim:
   ```bash
   vim ou nvim
   ```

3. Execute `:PlugInstall` no Vim para instalar os plugins.

---

## 9. Testes finais

- **Tema** e **ícones** devem carregar corretamente.
- **NERDTree**: `:NERDTreeToggle`
- Abra um arquivo de código (por exemplo, `main.cpp`).
- Verifique se o tema e a barra de status aparecem corretamente.
- Teste o autocomplete (YouCompleteMe) pressionando `<C-Space>`.
- Verifique diagnósticos do LSP com `:LspStatus`.

Pronto! Seu ambiente Vim está pronto para desenvolvimento moderno com LSP, autocompletar e aparência personalizada.