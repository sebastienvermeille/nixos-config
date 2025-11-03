{ config, pkgs, ... }:

{
  # X server & graphical stack
  services.xserver.enable = true;

  # Display Manager (SDDM) configuration
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.displayManager.sddm.theme = "where_is_my_sddm_theme";

  # Enable Hyprland compositor
  programs.hyprland.enable = true;

  # Networking
  networking.networkmanager.enable = true;

  # Custom systemd service to enable 5G modem
  systemd.services.enable-5g-modem = {
    description = "Enable 5G modem";
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" "ModemManager.service" ];
    script = ''
      mbimcli --device-open-proxy --device="/dev/wwan0mbim0" --quectel-set-radio-state=on
      exit 0
    '';
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
    path = with pkgs; [
      bash
      modemmanager
      libmbim
    ];
  };

  # Uncomment or add other services you want to enable:
  # services.openssh.enable = true;
  # services.gnupg.agent.enable = true;

  # Keymap for X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.udisks2.enable = true;
  services.gvfs.enable = true;       # Needed for Nautilus, Thunar, etc.
  services.tumbler.enable = true;    # Optional: thumbnails in file managers

  security.polkit.enable = true; # allow automounts without sudo

  # Any other services you want to enable can go here
  services.dbus.enable = true;
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

}
