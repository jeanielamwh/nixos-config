{ config, pkgs, ... }:

{
  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    tree
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName  = "Jeanie Lam";
    userEmail = "jeanielamwh@gmail.com";
  };

  programs.neovim = {
    enable = true;
    extraConfig = ''
      set expandtab smarttab autoindent
      set nohlsearch
      set number
      set relativenumber
      set tabstop=4 softtabstop=4 shiftwidth=4
      set title
      '';
      defaultEditor = true;
      vimAlias = true;
    };

  programs.tmux = {
    enable = true;
    extraConfig = ''
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R
    '';
    mouse = true;
    prefix = "C-a";
  };

  programs.zsh.enable = true;

  home.stateVersion = "23.05"; # Please read the comment before changing.
}
