{ config, pkgs, hyprland, ... }@inputs :
{
  imports = [
    hyprland.homeManagerModules.default
  ];

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    tree
    (nerdfonts.override { fonts = ["FiraCode" "Hack" "JetBrainsMono" "Noto"]; })
  ];

  fonts.fontconfig.enable = true;

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

  programs.chromium = {
    enable = true;
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

  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        modules-left = [ "sway/workspaces" "sway/mode" "wlr/taskbar" ];
      };
    };
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
