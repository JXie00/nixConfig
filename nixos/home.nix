{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "jet";
  home.homeDirectory = "/home/jet";
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs;[ 
         croc 
         ripgrep
         go
         omnisharp-roslyn
         meld
         android-tools
         android-studio
         insomnia
         mono
         (with dotnetCorePackages; combinePackages [ sdk_5_0 sdk_6_0 ])
         cmake
         xclip
         ];

 
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    extraConfig = 
       ''
        luafile ${/home/jet/Documents/dotfiles/nixos.lua}
      '';

    extraPackages = with pkgs; [
    sumneko-lua-language-server
    nix
    ];

    
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
