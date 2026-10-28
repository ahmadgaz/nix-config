{ pkgs, ... }:
{
  # Packages
  home.packages = with pkgs; [
    brightnessctl
  ];

  programs.kitty.enable = true;

  programs.fuzzel.enable = true;

  programs.waybar.enable = true;

  # Configuration
  wayland.windowManager.niri = {
    enable = true;
    systemd.enable = false; # Conflicts with UWSM if enabled
    
    # Use HM module while using Hyprland from NixOS module
    portalPackage = null;

    enableDefaultConfig = true;

    settings = {
      binds = {
        "Mod+T".spawn = "kitty";
        "Mod+Return".spawn = "kitty";
      };
      _children = [
        {
          output = {
            _args = [ "eDP-1" ];
            scale = 1.0;
          };
        }
      ];
    };
  };
}
