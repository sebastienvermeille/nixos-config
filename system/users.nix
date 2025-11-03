{ config, pkgs, ... }:

{
  users.users = {
    razornovo = {
      isNormalUser = true;
      description = "razornovo";
      extraGroups = [ "networkmanager" "wheel" "storage" ];
      packages = with pkgs; [];
      #shell = pkgs.zsh;  # Or pkgs.bash, pkgs.fish, etc.
      # You can also set a hashed password here if needed
      # hashedPassword = "your hashed password here";
      # For SSH keys, you can add authorizedKeys.keys = [ "ssh-rsa AAAA..." ];
    
    };
  };
}
