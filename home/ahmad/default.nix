{ config, pkgs, ... }:
{
  imports = [
    ../../modules/home/git.nix
    ../../modules/home/niri.nix
    ../../modules/home/zsh.nix
  ];

  # Packages
  home.packages = with pkgs; [
    curl

    # Neovim
    neovim
    nixd
    nixfmt
  ];

  programs.git.settings.user = {
    name = "Ahmad Gazali";
    email = "ahga.pr.xyz@gmail.com";
  };

  programs.home-manager.enable = true;

  programs.ripgrep.enable = true;

  programs.fd.enable = true;

  programs.gcc.enable = true;

  # Home configuration
  home.username = "ahmad";
  home.homeDirectory = "/home/ahmad";
  home.stateVersion = "26.05";

  home.sessionVariables.EDITOR = "nvim";
  xdg.configFile."nvim".source =
    config.lib.file.mkOutOfStoreSymlink "/home/ahmad/nix-config/home/ahmad/nvim";

}
