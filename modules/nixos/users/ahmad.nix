{ pkgs, ... }:
{
  # Packages
  programs.zsh.enable = true;
  programs.zsh.enableGlobalCompInit = false; # Let user-level completions run instead

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
