{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wget
    kitty
    git
    usbutils
    htop
    modemmanager
    wofi
    where-is-my-sddm-theme
    waybar

    # utilities
    hypridle
    hyprlock
    brightnessctl
    playerctl
    networkmanagerapplet
    pavucontrol

    arandr
    wlr-randr

    flameshot

    # 5g router utilities
    libmbim

    libreoffice
    nautilus
    gvfs

    # Uncomment or add other packages you want globally:
    # firefox
    # brave
    # gnome-calculator
    # gnome-text-editor
    # jetbrains-toolbox
  ];
}
