#
# Neovim
#

{ pkgs, home, ... }:

{
  programs = {
    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;

      plugins = with pkgs.vimPlugins; [

        # Syntax
        vim-nix
        vim-markdown

        # Quality of life
        vim-lastplace         # Opens document where you left it
        auto-pairs            # Print double quotes/brackets/etc
        vim-gitgutter         # See uncommitted changes of file :GitGutterEnable

        # File Tree
        nerdtree              # File Manager - set in extraConfig to F6

        # Customization 
        wombat256-vim         # Color scheme for lightline
        srcery-vim            # Color scheme for text

        lightline-vim         # Info bar at bottom
        indent-blankline-nvim # Indentation lines
      ];
      extraConfig = ''
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
        set number                                " Set numbers
        set clipboard+=unnamedplus

        colorscheme srcery                        " Color scheme text
        let g:lightline = {
          \ 'colorscheme': 'wombat',
          \ }                                     " Color scheme lightline
        highlight Comment cterm=italic gui=italic " Comments become italic
        hi Normal guibg=NONE ctermbg=NONE         " Remove background, better for personal theme
        
        imap jk <ESC>
        nmap <F6> :NERDTreeToggle<CR>             " F6 opens NERDTree
        map <C-j> <C-W>j
        map <C-K> <C-W>k
        map <C-h> <C-W>h
        map <C-l> <C-W>l
        noremap <C-up> <c-w>+
        noremap <C-down> <c-w>-
        noremap <C-left> <c-w>>
        noremap <C-right> <c-w><

        
        map <leader>tn :tabnew<cr>
        map <leader>to :tabonly<cr>
        map <leader>q :bd<cr>
        map <leader>tm :tabmove
        map <leader>t<leader> :tabnext
        map <leader>ws :split<cr>
        map <leader>wS :vsplit<cr>
        map <leader>l :bnext<cr>
        map <leader>h :bprevious<cr>
        

      '';

    };
  };
}
