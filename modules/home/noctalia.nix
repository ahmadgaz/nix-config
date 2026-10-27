{ inputs, ... }:
{
  imports = [ inputs.noctalia.homeModules.default ];

  programs.noctalia.enable = true;
  programs.noctalia.systemd.enable = true;
}
