{ pkgs, modulesPath, ... }:

{
  imports =
  [
    ./hardware-configuration.nix
    ../../user.nix
  ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  hardware.bluetooth.enable = true;

  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  networking.hostName = "desktop";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/London";

  nixpkgs.config.allowUnfree = true;

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
    };
  };

  environment.variables.EDITOR = "nvim";

  environment.systemPackages = with pkgs; [
    git
    gnumake
    killall
    pavucontrol
    tmux
    vim
    virt-manager
    waybar
    wl-clipboard
    wofi
    xdg-utils # required to open url from some desktop apps
  ];

  nixpkgs.overlays = [
    (self: super: {
      waybar = super.waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      });
    })
  ];

  fonts.fontconfig.subpixel.rgba = "rgb"; # slightly better or placebo?

  programs.hyprland.enable = true;

  security.polkit.enable = true;

  services.openssh.enable = true;

  programs.dconf.enable = true;

  virtualisation.libvirtd.enable = true;

  services.nfs.server.enable = true;

  networking.firewall.allowedTCPPorts = [ 2049 ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}
