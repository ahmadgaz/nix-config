{ pkgs, ... }:
{
  # Enable sound.
  services.pipewire.enable = true;
  services.pipewire.pulse.enable = true;

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # programs.firefox.enable = true;

}
