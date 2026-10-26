{ pkgs, ... }:
{
  # Packages
  environment.systemPackages = with pkgs; [
    wget
  ];

  programs.git.enable = true;

  programs.vim.enable = true;

  services.openssh.enable = true;

  services.fwupd.enable = true;

  # System configuration
  time.timeZone = "America/Los_Angeles";
  i18n.defaultLocale = "en_US.UTF-8";
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

}
