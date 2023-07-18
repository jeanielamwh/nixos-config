{ pkgs, ... }:

{
  users.users.funsun = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    initialPassword = "1234";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIC0d5IIxsBE8j0z0EIYGXKdvZH/c5+IbBGiGkHPODaSX"
    ];
  };
}