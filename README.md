## Guia de Instalação e Configuração dos Plugins com vim-plug

Este guia descreve os passos necessários para instalar e configurar todas as dependências e plugins listados no seu arquivo de configuração usando o gerenciador **vim-plug**. Ao final, seu Vim ficará equipado com tema moderno, suporte a LSP, autocompletar avançado e uma barra de status personalizada.

---

## 1. Pré-requisitos

Antes de iniciar, certifique-se de ter instalado em seu sistema:

- **Vim** (versão >= 8.0) ou **Neovim** (recomendado para melhor compatibilidade com LSP).
- **Git**: necessário para clonar os repositórios dos plugins.
- **CMake** e **Python 3-dev / Python-devel**: requeridos para compilar o YouCompleteMe.
- **ccls** (ou outro servidor LSP de sua preferência) para C/C++.
- **Node.js** (opcional, caso você queira usar outros LSPs baseados em JavaScript).
- **Fonte Powerline ou Nerd Font**: necessária para ícones na barra de status com vim-airline.

### Exemplo de instalação em distribuições Debian/Ubuntu:
```bash
sudo apt update
sudo apt install -y vim git cmake python3-dev build-essential ccls nodejs npm fonts-powerline
```

---

## 2. Instalando o vim-plug

Caso ainda não tenha o **vim-plug** instalado, execute o comando:

```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Para Neovim, use:

```bash
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

---

## 3. Definindo os plugins no seu `vimrc` / `init.vim`

No início do seu arquivo de configuração, inclua:

```vim
call plug#begin('~/.vim/plugged')

" --- TEMAS E CORES ---
Plug 'ghifarit53/tokyonight-vim'

" --- AUTOCOMPLETAR E LSP ---
Plug 'ycm-core/YouCompleteMe'
Plug 'jiangmiao/auto-pairs'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

" --- INTERFACE E STATUS ---
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()
```

---

## 4. Instalando os plugins

1. Abra o Vim/Neovim:
   ```bash
   vim
   ```
2. No modo comando, execute:
   ```vim
   :PlugInstall
   ```
3. Aguarde até que todos os repositórios sejam baixados e instalados.

---

## 5. Pós-instalação: YouCompleteMe

O **YouCompleteMe** requer compilação adicional:

1. Acesse o diretório do plugin:
   ```bash
   cd ~/.vim/plugged/YouCompleteMe
   ```
2. Execute o script de instalação:
   ```bash
   python3 install.py --all
   ```
   - `--all` compila todos os suportes de linguagens (C-family, Python, Go, etc.).
3. Caso precise apenas de suporte C/C++ (via ccls):
   ```bash
   python3 install.py --clangd-completer
   ```
4. Verifique se o compilador `clang` e `cmake` estão disponíveis no PATH.

---

## 6. Configuração dos servidores LSP

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

## 7. Configurações adicionais de aparência

No seu `vimrc`, adicione:
```vim
" Suporte a 24-bit colors
set termguicolors
" Estilo do tema Tokyo Night
let g:tokyonight_style = 'night'
let g:tokyonight_enable_italic = 1
colorscheme tokyonight

" Destaque de parênteses
hi! MatchParen cterm=NONE,bold gui=NONE,bold guibg=#87c095
```

Para a barra de status com ícones:
```vim
let g:airline_powerline_fonts = 1
```

---

## 8. Outras configurações úteis

```vim
" Números de linha
set number

" Cursorline
set cursorline

" Mouse no terminal
set mouse=a

" Tabulação e indentação
set tabstop=2
set shiftwidth=2
set expandtab

" Fold por sintaxe
set foldmethod=syntax

" Retorna ao ponto de edição anterior
augroup last_cursor
  autocmd!
  autocmd BufReadPost * if line("'"") > 0 && line("'"") <= line("$") |
    exe "normal! g'"" |
  endif
augroup END
```

---

## 9. Verificando a instalação

1. Abra um arquivo de código (por exemplo, `main.cpp`).
2. Verifique se o tema e a barra de status aparecem corretamente.
3. Teste o autocomplete (YouCompleteMe) pressionando `<C-Space>`.
4. Verifique diagnósticos do LSP com `:LspStatus`.

Pronto! Seu ambiente Vim está pronto para desenvolvimento moderno com LSP, autocompletar e aparência personalizada.


---

## 10. Substituindo seu arquivo `.vimrc`

Caso você queira utilizar a configuração completa diretamente:

1. Salve o conteúdo da configuração em um arquivo chamado `.vimrc`:
   ```bash
   cp caminho/do/seu/arquivo_de_configuracao ~/.vimrc
   ```

   Exemplo, caso o arquivo esteja no mesmo local deste guia:
   ```bash
   cp caminho/do/seu/arquivo_de_configuracao ~/.vimrc
   ```

2. Reinicie o Vim:
   ```bash
   vim
   ```

3. Execute `:PlugInstall` no Vim para instalar os plugins.

⚠️ **Atenção:** Isso irá sobrescrever seu `.vimrc` atual. Faça um backup, se necessário:
```bash
cp ~/.vimrc ~/.vimrc.backup
```