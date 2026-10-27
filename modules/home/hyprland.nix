{
  config,
  lib,
  pkgs,
  ...
}:
let
  lua = lib.generators.mkLuaInline;
  bind = key: action: {
    _args = [
      key
      (lua action)
    ];
  };
  # bindr = key: action: { _args = [ key (lua action) { locked = true; repeating = true; } ]; };
  workspaceBinds = builtins.concatLists (
    builtins.genList (
      i:
      let
        n = toString (i + 1);
      in
      [
        (bind "SUPER + ${n}" "hl.dsp.focus({ workspace = ${n} })")
        (bind "SUPER + SHIFT + ${n}" "hl.dsp.window.move({ workspace = ${n} })")
      ]
    ) 9
  );
in
{
  # Packages
  home.packages = with pkgs; [
    brightnessctl
  ];

  programs.fuzzel.enable = true;

  programs.kitty.enable = true;

  # programs.waybar.enable = true;
  # programs.waybar.systemd.enable = true;

  # Configuration
  xdg.configFile."uwsm/env".source =
    "${config.home.sessionVariablesPackage}/etc/profile.d/hm-session-vars.sh"; # Give UWSM same env as shell

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false; # Conflicts with UWSM if enabled

    # Use HM module while using Hyprland from NixOS module
    package = null;
    portalPackage = null;

    settings.bind = [
      (bind "SUPER + RETURN" ''hl.dsp.exec_cmd("kitty")'')
      (bind "SUPER + D" ''hl.dsp.exec_cmd("fuzzel")'')
      (bind "SUPER + Q" "hl.dsp.window.close()")
      (bind "SUPER + SHIFT + E" ''hl.dsp.exec_cmd("uwsm stop")'')
      
      # Change focus with arrow keys
      (bind "SUPER + left" ''hl.dsp.focus({ direction = "left" })'')
      (bind "SUPER + right" ''hl.dsp.focus({ direction = "right" })'')
      (bind "SUPER + up" ''hl.dsp.focus({ direction = "up" })'')
      (bind "SUPER + down" ''hl.dsp.focus({ direction = "down" })'')
    ] ++ workspaceBinds;
  };
}
