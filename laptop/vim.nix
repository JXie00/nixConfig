{ pkgs, ... }:
{
  environment.variables = { EDITOR = "vim"; };

  environment.systemPackages = with pkgs; [
    ((vim_configurable.override {  }).customize{
      name = "vim";
      vimrcConfig.customRC = ''
	let mapleader = " "
	syntax enable                             " Syntax highlighting
	set nocompatible
	set tabstop=4
	set incsearch
	set ignorecase
	set smartcase
	set showmatch
	set mat=2
	set hlsearch
	set wildmenu
	set wildmode=list:longest
	set ai
	set si
	set clipboard+=unnamedplus
	colorscheme dracula                        " Color scheme t
	highlight Comment cterm=italic gui=italic " Comments become italic
	hi Normal guibg=NONE ctermbg=NONE         " Remove background, better for personal theme

	imap jk <ESC>
	map <C-j> <C-W>j
	map <C-K> <C-W>k
	map <C-h> <C-W>h
	map <C-l> <C-W>l
	nnoremap <C-up> <c-w>+
	nnoremap <C-down> <c-w>-
	nnoremap <C-left> <c-w>>
	nnoremap <C-right> <c-w><

	nnoremap <C-s> :w<cr>

	imap <C-s> <ESC>:w<cr>

	map <leader>tn :tabnew<cr>
	map <leader>to :tabonly<cr>
	map <leader>q :bd<cr>
	map <leader>tm :tabmove
	map <leader>t<leader> :tabnext
	map <leader>ws :split<cr>
	map <leader>wS :vsplit<cr>
	map <leader>l :bnext<cr>
	map <leader>h :bprevious<cr>


	nnoremap <leader><leader> :Buffers<cr>
	nnoremap <leader>, :Files %:p:h<cr>

	nnoremap <leader>fw :Windows<cr>

	nnoremap <leader>? :History<cr>

	nnoremap <leader>c :History:<cr>

	nnoremap <leader>. :Commands<cr>

	nnoremap <leader>fh :Helptags<cr>

	nnoremap <leader>ff :Files<cr>

	nnoremap <leader>/ :BLines<cr>

	nnoremap <leader>fg :Rg<cr>

      '';
    }
  )];
}

