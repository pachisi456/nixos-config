{ config, pkgs, ... }:

{
  users.defaultUserShell = pkgs.zsh;
  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    ohMyZsh = {
      enable = true;
      theme = "agnoster";
      plugins = [
        "git"
        "docker"
        "zsh-nvm"
      ];
    };

    shellAliases = {
      # NixOS.
      update = "sudo nixos-rebuild switch";

      # Set up 2 or 3 monitors. Done automatically with gnome. Useful for i3-only setup.
      xrandr-2 = "xrandr --output eDP-1 --off && xrandr --output DP-1-2 --auto && xrandr --output DP-1-1 --auto --left-of DP-1-2";
      xrandr-3 = "xrandr --output DP-1-2 --auto --left-of eDP-1 && xrandr --output DP-1-1 --auto --left-of DP-1-2";

      # Other.
      mux = "tmuxinator";
    };
  };
}

