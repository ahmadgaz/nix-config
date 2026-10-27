{ config, lib, ... }:
{
  xdg.configFile."uwsm/env".source =
    "${config.home.sessionVariablesPackage}/etc/profile.d/hm-session-vars.sh";
  programs.kitty.enable = true;
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false; # Conflicts with UWSM

    # Use HM module while using Hyprland from NixOS module
    package = null; 
    portalPackage = null;

    settings = {
      mod = {
        _var = "SUPER";
      };

      bind = [
        {
          _args = [
            (lib.generators.mkLuaInline "mod .. \" + Q\"")
            (lib.generators.mkLuaInline "hl.dsp.window.close()")
            { locked = true; }
          ];
        }
        {
          _args = [
            "SUPER + RETURN"
            (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"kitty\")")
          ];
        }
        {
          _args = [
            "ALT + R"
            (lib.generators.mkLuaInline "hl.dsp.submap(\"resize\")")
          ];
        }
      ];

      define_submap = {
        _args = [
          "resize"
          (lib.generators.mkLuaInline "function()\n  hl.bind(\"right\", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })\n  hl.bind(\"left\", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })\n  hl.bind(\"escape\", hl.dsp.submap(\"reset\"))\nend")
        ];
      };
    };
  };
}
