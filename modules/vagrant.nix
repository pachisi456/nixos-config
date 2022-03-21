{ config, pkgs, ... }:

{
  virtualisation.libvirtd.enable = true;
  boot.kernelModules = [ "kvm-amd" "kvm-intel" ];

  users.users.pachisi456.extraGroups = [
    "qemu-libvirtd"
    "libvirtd"
  ];

  environment.systemPackages = with pkgs; [
    vagrant
  ];
}
