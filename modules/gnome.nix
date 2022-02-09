{ config, pkgs, ... }:

{
  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.gnome.core-utilities.enable = false;

  nixpkgs.config.firefox.enableGnomeExtensions = true;
  services.gnome.chrome-gnome-shell.enable = true;

  environment.systemPackages = with pkgs; [
    gnome.gedit
    gnome.gnome-panel
    gnome.gnome-screenshot
    gnome.gnome-tweaks
    gnome.nautilus

    gnomeExtensions.random-wallpaper
  ];
}
