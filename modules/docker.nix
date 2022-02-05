{ config, pkgs, ... }:

{
  virtualisation.docker.enable = true;

  users.users.pachisi456 = {
    extraGroups = [ "docker" ];
  };
}
