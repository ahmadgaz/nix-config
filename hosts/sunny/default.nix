{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./disko.nix
    ../../modules/nixos/common.nix
    ../../modules/nixos/client.nix
    ../../modules/nixos/users/ahmad.nix
  ];

  # Packages
  boot.loader.systemd-boot.enable = true;

  # System configuration
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "sunny";
  system.stateVersion = "26.05";

}
