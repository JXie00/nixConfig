{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "jet";
  home.homeDirectory = "/home/jet";
  nixpkgs.config.allowUnfree = true;

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.

home.packages = with pkgs; [
  lua
  jetbrains.rider
  nodejs
 postman
flameshot
btop

jetbrains-mono
inter
overpass
inconsolata-nerdfont
mononoki

binutils
gnutls
fd
imagemagick
zstd
ripgrep
emacs-all-the-icons-fonts
pandoc
plantuml
(aspellWithDicts (dicts: with dicts; [en en-computers en-science]))
mu
isync
msmtp

rnix-lsp
nixfmt

gcc
unzip
alacritty

dotnet-sdk_7
omnisharp-roslyn

];

  
programs.git ={
  enable = true;
  userName = "jet";
  userEmail = "jx2421533662@gmail.com";
};


programs.emacs ={
  enable = true;
  package = pkgs.emacs28NativeComp;
  extraPackages = epkgs : [epkgs.vterm epkgs.sqlite3 ];
};


programs.direnv ={
  enable = true;
  nix-direnv.enable = true;
};

programs.lsd ={
  enable = true;
  enableAliases = true;
};

programs.starship ={
  enable = true;
  enableFishIntegration = true;
};

programs.neovim ={
  enable = true;
  vimAlias = true;
  viAlias = true;
};

  home.stateVersion = "22.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
