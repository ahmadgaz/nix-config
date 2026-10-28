{ pkgs, ... }:
{
  # Packages
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-color-emoji
    nerd-fonts.jetbrains-mono
  ];

  # programs.hyprland.enable = true;
  # programs.hyprland.withUWSM = true;

  programs.niri.enable = true;

  programs.firefox.enable = true;

  services.pipewire.enable = true;

  services.upower.enable = true;

  services.power-profiles-daemon.enable = true;

  hardware.bluetooth.enable = true;

  # services.libinput.enable = true;

  networking.networkmanager.enable = true;

  security.rtkit.enable = true;

  # System configuration
  environment.sessionVariables.NIXOS_OZONE_WL = "1"; # Electron apps use Wayland

}
