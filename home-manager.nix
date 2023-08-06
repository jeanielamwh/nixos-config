{ config, pkgs, ... }:
{
  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    tree
  ];

  home = {
    username = "funsun";
    homeDirectory = "/home/funsun";
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.alacritty = {
    enable = true;
    settings = {
      env.TERM = "xterm-256color";
      font.size = 12;
    };
  };

  programs.firefox.enable = true;

  programs.git = {
    enable = true;
    userName  = "Jeanie Lam";
    userEmail = "jeanielamwh@gmail.com";
  };

  programs.neovim = {
    enable = true;
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

  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      vscodevim.vim
    ];
  };

  programs.zsh.enable = true;

  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = builtins.readFile ./conf/hypr/hyprland.conf;
  };

  home.file.".config/Code/User/settings.json".source = ./conf/vscode/settings.json;
  # home.file.".config/hypr/hyprland.conf".source = ./conf/hypr/hyprland.conf;
  home.file.".config/nvim/init.vim".source = ./conf/vim/init.vim;

  home.stateVersion = "23.05"; # Please read the comment before changing.
}
