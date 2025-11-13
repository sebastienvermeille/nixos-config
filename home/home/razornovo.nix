{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  home.stateVersion = "25.05";

  #programs.zsh.enable = true;
  programs.git.enable = true;
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    firefox
    #brave
    #neovim
    #ripgrep
    #bat
    nodejs
    jetbrains-toolbox
    nautilus
  ];

  programs.brave = {
    enable = true;
    extensions = [
      { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; }  # uBlock Origin
      { id = "nngceckbapebfimnlniiiahkandclblb"; } # Bitwarden
    ];
    commandLineArgs = [
      "--force-dark-mode"
      "--disable-features=PasswordManagerOnboarding"
    ];
  };
}

