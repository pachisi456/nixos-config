# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix

      modules/docker.nix
      modules/git.nix
      modules/gnome.nix
      modules/gpg.nix
      modules/i3/module.nix
      modules/sound.nix
      modules/vim.nix
      modules/zsh.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # Time zone.
  time.timeZone = "Europe/Berlin";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.wlp2s0.useDHCP = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Touchpad support.
  services.xserver.libinput.enable = true;

  # User.
  users.users.pachisi456 = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
  };

  # Packages.
  environment.systemPackages = with pkgs; [
    # Command line.
    alacritty
    ansible
    curl
    htop
    tmux
    tmuxinator
    unzip
    wget

    # Editors.
    vscode

    # Coding.
    act
    ansible
    dbeaver
    insomnia
    nodejs-16_x
    yarn

    # Browsers.
    firefox
    google-chrome
    rambox

    # Messengers.
    signal-desktop
    tdesktop # Telegram
    teams

    # Other applications.
    flameshot # TODO Fix.
    megasync
    spotify
    thunderbird
  ];

  # Allow unfree packages, e.g. vscode.
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "21.11";
}
