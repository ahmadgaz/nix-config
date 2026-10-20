{ config, pkgs, ... }:
{
  imports = [
    ../../modules/home/git.nix
    ../../modules/home/shell.nix
  ];

  home.packages = with pkgs; [
    curl
    zsh

    # Neovim
    neovim
    ripgrep fd gcc
    nixd nixfmt
  ];

  home.username = "ahmad";
  home.homeDirectory = "/home/ahmad";
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;

  programs.git.settings.user = {
    name = "Ahmad Gazali";
    email = "ahga.pr.xyz@gmail.com";
  };

  home.sessionVariables.EDITOR = "nvim";
  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink "/home/ahmad/nix-config/home/ahmad/nvim";

}

