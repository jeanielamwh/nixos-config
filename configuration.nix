{ modulesPath, pkgs, ... }:

{
  imports = [
    "${modulesPath}/virtualisation/amazon-image.nix"
  ];

  ec2.efi = true;

  # nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim
  ];

  users.users.wlam183 = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    openssh.authorizedKeys.keys = [ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDOw5/GzuHsp2eG32mOVOybQsfDnUAWNcFxZg8GusUUfNfx+d9D4I1jB6n7u6V48YOpbh219yWEhvmW/vC/Ivo+90ET0WWNOWdyXU17loLGiCHMpuT9rcbhA0HQSRtQzFj+BR5Da/7+gsmtnExlDhfAkMtjRKbvL+/hm/zpWCLuNqYSfiOrkTQ9xa3E3h/WzP/32ytDw/As5+p6pmXqL6hNw16ThiFQW3QxgBfYh6Q4841rZlyDDy58pocxAK0E+X28y6AjycEoFPhbsvwLX7yA2ivyc/hrIalnDmwJl0wuiINnUpm+upyPAxE8IYbdvav3SNcFWW3BLcNN+clOeZ1D8LbMiwEpwPttHlwHuFmSwDwSUe3/UqK3RNpEM5KemHKYbzz39N2LxxMXDm4XXMMCIz9/rtRzlmJZGgcU529N/Y5W+nHUUMfwzUa0zHzWV7QfT6gXgabwtXK+hstQN3FGQNanbP+vjm2Gx1XqUubbTUPD4FVL/x1zt7OQsFUZNG8= wlam183@C02FL41YMD6R" ];
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}
