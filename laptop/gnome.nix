{pkgs,...}: 
{
  environment.systemPackages = with pkgs; [
     papirus-icon-theme
     gnomeExtensions.paperwm
     gnomeExtensions.dash-to-dock
     gnomeExtensions.impatience
     gnomeExtensions.appindicator
     gnomeExtensions.reorder-workspaces
     gnomeExtensions.clipboard-indicator
     gnomeExtensions.blur-my-shell
     gnomeExtensions.sound-output-device-chooser
     gnomeExtensions.pop-shell
     gnomeExtensions.pop-launcher-super-key 
  ];

}
