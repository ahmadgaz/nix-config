{ pkgs, ... }:
{
  # User configuration
  users.users.ahmad = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
    shell = pkgs.zsh;
  };

}
