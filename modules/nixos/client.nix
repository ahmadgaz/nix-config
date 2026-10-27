{ pkgs, ... }:
{
  # Packages
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-color-emoji
    nerd-fonts.jetbrains-mono
  ];

  programs.hyprland.enable = true;   
  programs.hyprland.withUWSM = true;

  programs.waybar.enable = true;

  services.pipewire.enable = true;
  services.pipewire.pulse.enable = true;

  networking.networkmanager.enable = true;

  # services.libinput.enable = true;

  # programs.firefox.enable = true;
  
  # System configuration
  environment.sessionVariables.NIXOS_OZONE_WL = "1"; # Electron apps use Wayland

}
