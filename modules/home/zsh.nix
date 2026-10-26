{ ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true; # Run user-level completions
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ll = "ls -l";
      rebuild = "nixos-rebuild switch --sudo --flake ~/nix-config";
      hms = "home-manager switch --flake ~/nix-config";
    };
  };

}
