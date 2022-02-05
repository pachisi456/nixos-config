{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gtk2
  ];

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryFlavor = "gtk2";
  };
}
