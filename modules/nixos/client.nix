{ pkgs, ... }:
{
  # Packages
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-emoji
    nerd-fonts.jetbrains-mono
  ];

  programs.hyprland.enable = true;   
  programs.hyprland.withUWSM = true;

  services.pipewire.enable = true;
  services.pipewire.pulse.enable = true;

  networking.networkmanager.enable = true;

  # services.libinput.enable = true;

  # programs.firefox.enable = true;
  
  # System configuration

}
