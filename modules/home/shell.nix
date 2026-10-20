{ ... }:
{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ll = "ls -l";
      rebuild = "nixos-rebuild switch --sudo --flake ~/nix-config";
      hms = "home-manager switch --flake ~/nix-config";
    };
  };

}

