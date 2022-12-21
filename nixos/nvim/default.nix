#
# Neovim
#

{ pkgs, config, ... }:

{
  programs = {
    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
        
      configure ={ customRC= ''
      

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
        let g:lightline = {
          \ 'colorscheme': 'dracula',
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

        nnoremap <leader>sf <cmd>Telescope find_files<cr>
        nnoremap <leader>sh <cmd>Telescope help_tags<cr>
        nnoremap <leader>sg <cmd>Telescope live_grep<cr>
        nnoremap <leader>? <cmd>Telescope oldfiles<cr>

        nnoremap <leader>. <cmd>Telescope commands<cr>

        nnoremap <leader>sw <cmd>Telescope grep_string<cr>

        nnoremap <leader>sd <cmd>Telescope diagnostics<cr>

        nnoremap <leader><leader> <cmd>Telescope buffers<cr>

        nnoremap <leader>ds <cmd>Telescope lsp_document_symbols<cr>

        nnoremap <leader>ws <cmd>Telescope lsp_dynamic_workspace_symbols<cr>

      '';
      packages.myVimPackage = with pkgs.vimPlugins; {
    # loaded on launch
    start = [
      fugitive 
     nvim-lspconfig 
        
        nvim-cmp
        cmp-nvim-lsp
        cmp-buffer
        cmp-path
        cmp-calc
        cmp-spell
        cmp-emoji
        cmp-treesitter
        cmp-latex-symbols
        cmp-omni
        cmp-vsnip

        telescope-nvim 
        plenary-nvim
        nvim-treesitter
        nvim-treesitter-textobjects
        telescope-fzf-native-nvim
        dracula-nvim




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
        #dracula-nvim

        lightline-vim         # Info bar at bottom
        indent-blankline-nvim # Indentation lines
  ];
    # manually loadable by calling `:packadd $plugin-name`
    opt = [ ];
  };
  
    };};
  };
}
