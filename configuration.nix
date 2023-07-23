{ pkgs, modulesPath, ... }:

{
  imports =
  [
    (modulesPath + "/virtualisation/parallels-guest.nix")
    ./hardware-configuration.nix
    ./user.nix
  ];

  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
    };
    efi.canTouchEfiVariables = true;
  };

  nixpkgs.config.allowUnfree = true;

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
    };
  };

  environment.systemPackages = with pkgs; [
    git
    gnumake
    tmux
    vim
    wofi
  ];

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS="1";
  };

  programs.hyprland.enable = true;

  services.openssh.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}
