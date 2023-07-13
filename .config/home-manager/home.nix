{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "keith";
  home.homeDirectory = "/home/keith";
  home = {

    # This value determines the Home Manager release that your configuration is
    # compatible with. This helps avoid breakage when a new Home Manager release
    # introduces backwards incompatible changes.
    #
    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    stateVersion = "23.05"; # Please read the comment before changing.

    # The home.packages option allows you to install Nix packages into your
    # environment.
    packages = [
      pkgs.alacritty
      pkgs.discord
      pkgs.betterdiscordctl
      pkgs.thunderbird
      pkgs.yt-dlp
      pkgs.keepassxc
      pkgs.libreoffice
      pkgs.qutebrowser
      pkgs.virt-manager
      pkgs.gpodder
      pkgs.gparted
      pkgs.yt-dlp
      pkgs.tldr
      pkgs.tor-browser-bundle-bin
      pkgs.stow
      pkgs.luarocks

      # Gaming
      #pkgs.steam
      #pkgs.steam-run
      pkgs.lutris
      pkgs.heroic
      pkgs.gamemode
      pkgs.protonup-ng
      #pkgs.proton-ge
      #pkgs.wine-osu
      #pkgs.wine-tkg

      # Game Dev
      pkgs.godot
      pkgs.unityhub
      pkgs.blender

      # Torrenting
      pkgs.mullvad-vpn
      pkgs.qbittorrent

      # Thunar
      pkgs.xfce.thunar
      pkgs.xfce.thunar-volman
      pkgs.xfce.thunar-dropbox-plugin
      pkgs.xfce.thunar-archive-plugin
      pkgs.xfce.thunar-media-tags-plugin

      pkgs.syncthing
      pkgs.syncthing-tray

      # Socials
      pkgs.discord
      pkgs.signal-desktop
      pkgs.zoom-us
      pkgs.slack

      pkgs.ani-cli
      pkgs.mangal
      # pkgs.tachidesk

      pkgs.vim
      pkgs.neovim
      pkgs.emacs

      # # It is sometimes useful to fine-tune packages, for example, by applying
      # # overrides. You can do that directly here, just don't forget the
      # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
      # # fonts?
      # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

      # # You can also create simple shell scripts directly inside your
      # # configuration. For example, this adds a command 'my-hello' to your
      # # environment:
      # (pkgs.writeShellScriptBin "my-hello" ''
      #   echo "Hello, ${config.home.username}!"
      # '')
    ];

    # Home Manager is pretty good at managing dotfiles. The primary way to manage
    # plain files is through 'home.file'.
    file = {
      # # Building this configuration will create a copy of 'dotfiles/screenrc' in
      # # the Nix store. Activating the configuration will then make '~/.screenrc' a
      # # symlink to the Nix store copy.
      # ".screenrc".source = dotfiles/screenrc;

      # # You can also set the file content immediately.
      # ".gradle/gradle.properties".text = ''
      #   org.gradle.console=verbose
      #   org.gradle.daemon.idletimeout=3600000
      # '';
    };

    # You can also manage environment variables but you will have to manually
    # source
    #
    #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
    #
    # or
    #
    #  /etc/profiles/per-user/keith/etc/profile.d/hm-session-vars.sh
    #
    # if you don't want to manage your shell through Home Manager.
    sessionVariables = {
      # EDITOR = "emacs";
    };
  };

# services.syncthing.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
