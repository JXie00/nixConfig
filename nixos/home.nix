{ config, pkgs, home, ... }:

{
  programs.bash.enable = true;
  imports = [ ./nvim ];
  home.stateVersion = "22.05";
  home.packages = with pkgs; [peek htop youtube-dl];
}
