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
      config = "sudo vim /etc/nixos/configuration.nix";
      update = "sudo nixos-rebuild switch";

      # Other.
      mux = "tmuxinator";
    };
  };
}

