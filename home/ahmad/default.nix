{ pkgs, ... }:
{
  imports = [
    ../../modules/home/git.nix
    ../../modules/home/shell.nix
  ];

  home.packages = with pkgs; [
    curl
    zsh
  ];

  home.username = "ahmad";
  home.homeDirectory = "/home/ahmad";
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;

  programs.git.settings.user = {
    name = "Ahmad Gazali";
    email = "ahga.pr.xyz@gmail.com";
  };

}

