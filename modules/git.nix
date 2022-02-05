{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    config = {
      user = {
        name = "Luca Dommes";
        email = "luca.dommes@devterm.de";
        signingkey = "16DEEEC25A1A02ACB0A448242A7968F4D7A82380";
      };
      commit.gpgsign = true;

      pull.ff = "only";

      alias = {
        co = "checkout";
        c = "commit";
        fixup = "commit --fixup";
        s = "status";
        last = "!git --no-pager log -1 HEAD";
      };
    };
  };

  # GitHub CLI.
  environment.systemPackages = with pkgs; [ gh ];
}

