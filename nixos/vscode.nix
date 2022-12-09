{ pkgs,... }:

{
environment.systemPackages = with pkgs; [
  (vscode-with-extensions.override {
    vscodeExtensions = with vscode-extensions; [
      bbenoist.nix
      ms-python.python
      ms-azuretools.vscode-docker
      ms-vscode-remote.remote-ssh
      dracula-theme.theme-dracula
      vscodevim.vim
      yzhang.markdown-all-in-one
      #2gua.rainbow-brackets
      dbaeumer.vscode-eslint
      eamodio.gitlens
      esbenp.prettier-vscode
      usernamehw.errorlens
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "remote-ssh-edit";
        publisher = "ms-vscode-remote";
        version = "0.47.2";
        sha256 = "1hp6gjh4xp2m1xlm1jsdzxw9d8frkiidhph6nvl24d0h8z34w49g";
      }
    ];
  })
];	
}
