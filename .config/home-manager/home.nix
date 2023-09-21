{ config, lib, pkgs, inputs, ... }:

{

  imports = [
    inputs.xremap-flake.homeManagerModules.default
    inputs.nix-colors.homeManagerModules.default
    ./features/alacritty
    ./features/dunst
    ./features/emacs
    ./features/firefox
    ./features/git
    ./features/nvim
    ./features/gtk
    # ./features/mako.nix
    # ./features/qutebrowser.nix
    # ./features/spicetify.nix
    ./features/xremap
  ];

  #nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [
    "openssl-1.1.1u"
    "python-2.7.18.6"
    "nodejs-16.20.1"
    "nodejs-16.20.2"
  ];
  # nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
  #   "postman"
  # ];
  targets.genericLinux.enable = true; # Enable this on non nixos

  colorScheme = inputs.nix-colors.colorSchemes.onedark;
  # colorScheme = inputs.nix-colors.colorSchemes.dracula;
  # colorScheme = inputs.nix-colors.colorSchemes.nord;
  # colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-medium;
  # colorScheme = inputs.nix-colors.colorSchemes.solarized;
  # colorScheme = inputs.nix-colors.colorSchemes.tango;
  # colorScheme = inputs.nix-colors.colorSchemes.nova;

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
      pkgs.mcfly

      # Core Packages
      pkgs.libglvnd
      pkgs.mesa.drivers
      pkgs.killall
      pkgs.zip
      pkgs.unzip
      pkgs.light
      pkgs.thunderbird
      pkgs.yt-dlp
      pkgs.keepassxc
      pkgs.pass
      pkgs.libreoffice
      pkgs.github-desktop
      pkgs.github-cli
      # pkgs.firefox
      #pkgs.librewolf
      pkgs.gpodder
      pkgs.gparted
      pkgs.yt-dlp
      pkgs.tor-browser-bundle-bin
      pkgs.tldr
      pkgs.fzf
      pkgs.rsync
      pkgs.grsync
      pkgs.feh
      pkgs.htop
      pkgs.wget
      pkgs.gnupg
      pkgs.trash-cli
      pkgs.direnv
      pkgs.nix-direnv

      pkgs.rclone
      pkgs.rclone-browser

      pkgs.cmake

      (pkgs.python310.withPackages(ps: with ps; [ types-beautifulsoup4 beautifulsoup4 requests black pyside6 pylint pillow pywlroots ]))

      (pkgs.lua.withPackages(ps: with ps; [ luafilesystem ]))

      pkgs.nodejs_18
      # pkgs.swagger-cli
      pkgs.postman

      #pkgs.mongodb
      #pkgs.mongodb-tools
      #pkgs.mongosh

      pkgs.rustc
      pkgs.cargo
      pkgs.rustfmt
      pkgs.rust-analyzer
      pkgs.clippy

      pkgs.dracula-theme
      pkgs.dracula-icon-theme
      #pkgs.catppuccin-gtk
      #pkgs.lxappearance

      #pkgs.virt-manager
      #pkgs.libvirt
      #pkgs.libvirt-glib
      pkgs.quickemu
      pkgs.quickgui

      #pkgs.steam
      #pkgs.steam-run
      #pkgs.steamPackages.steamcmd
      #pkgs.steam-tui
      #(pkgs.steam.override {
      #  withPrimus = true;
      #  withJava = true;
      #  extraPkgs = pkgs: [
      #    pkgs.mono pkgs.gtk3 pkgs.gtk3-x11 pkgs.libgdiplus pkgs.zlib pkgs.bumblebee pkgs.glxinfo
      #  ];
      #  nativeOnly = true; })
      #pkgs.lutris

      pkgs.obs-studio
      #pkgs.heroic
      pkgs.gamemode
      pkgs.protonup-ng
      #pkgs.proton-ge
      pkgs.winetricks
      pkgs.protontricks
      #pkgs.wine-staging
      #pkgs.wine-osu
      #pkgs.wine-tkg
      #pkgs.openmw

      #pkgs.godot
      pkgs.godot_4
      pkgs.unityhub
      pkgs.blender

      pkgs.mullvad-vpn
      pkgs.qbittorrent

      # Xorg
      pkgs.xdg-desktop-portal-gtk
      pkgs.xorg.libX11
      pkgs.xorg.libX11.dev
      pkgs.xorg.libxcb
      pkgs.xorg.libXft
      pkgs.xorg.libXinerama
	    pkgs.xorg.xinit
      pkgs.xorg.xinput

      pkgs.syncthing
      pkgs.syncthing-tray

      pkgs.gpodder
      pkgs.ani-cli
      pkgs.mangal
      #pkgs.tachidesk

      pkgs.discord
      pkgs.betterdiscordctl
      pkgs.signal-desktop
      # pkgs.zoom-us
      # pkgs.slack

      pkgs.spotify
      pkgs.cava

      # pkgs.jetbrains.idea-ultimate
      # pkgs.jetbrains.idea-community
      # pkgs.jetbrains.clion
      # pkgs.jetbrains.rustrover

      # # It is sometimes useful to fine-tune packages, for example, by applying
      # # overrides. You can do that directly here, just don't forget the
      # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
      # # fonts?
      (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

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
      ".bashrc".source = ~/.dotfiles/.bashrc;
      ".bash_profile".source = ~/.dotfiles/.bash_profile;
      ".profile".source = ~/.dotfiles/.profile;
      ".dmenurc".source = ~/.dotfiles/.dmenurc;
      ".xinitrc".source = ~/.dotfiles/.xinitrc;

      # # You can also set the file content immediately.
      # ".gradle/gradle.properties".text = ''
      #   org.gradle.console=verbose
      #   org.gradle.daemon.idletimeout=3600000
      # '';
      ".config/qtile/colors.py".text = ''
        #!/usr/bin/env python3

        colors = {
            "00": "${config.colorScheme.colors.base00}",
            "01": "${config.colorScheme.colors.base01}",
            "02": "${config.colorScheme.colors.base02}",
            "03": "${config.colorScheme.colors.base03}",
            "04": "${config.colorScheme.colors.base04}",
            "05": "${config.colorScheme.colors.base05}",
            "06": "${config.colorScheme.colors.base06}",
            "07": "${config.colorScheme.colors.base07}",
            "08": "${config.colorScheme.colors.base08}",
            "09": "${config.colorScheme.colors.base09}",
            "10": "${config.colorScheme.colors.base0A}",
            "11": "${config.colorScheme.colors.base0B}",
            "12": "${config.colorScheme.colors.base0C}",
            "13": "${config.colorScheme.colors.base0D}",
            "14": "${config.colorScheme.colors.base0E}",
            "15": "${config.colorScheme.colors.base0F}"
        }'';
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
      EDITOR = "nvim";
      TERMINAL = "nixGL alacritty";
      TERMINAL_PROG = "nixGL alacritty";
      BROWSER = "firedragon";

      # ~/ Clean-up:
      XDG_CONFIG_HOME="$HOME/.config";
      XDG_DATA_HOME="$HOME/.local/share";
      XDG_CACHE_HOME="$HOME/.cache";
      XINITRC="$XDG_CONFIG_HOME/x11/xinitrc";
      #XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"; # This line will break some DMs.
      NOTMUCH_CONFIG="$XDG_CONFIG_HOME/notmuch-config";
      # GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0";
      WGETRC="$XDG_CONFIG_HOME/wget/wgetrc";
      INPUTRC="$XDG_CONFIG_HOME/shell/inputrc";
      ZDOTDIR="$XDG_CONFIG_HOME/zsh";
      GNUPGHOME="$XDG_DATA_HOME/gnupg";
      WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default";
      KODI_DATA="$XDG_DATA_HOME/kodi";
      PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store";
      TMUX_TMPDIR="$XDG_RUNTIME_DIR";
      ANDROID_SDK_HOME="$XDG_CONFIG_HOME/android";
      CARGO_HOME="$XDG_DATA_HOME/cargo";
      GOPATH="$XDG_DATA_HOME/go";
      GOMODCACHE="$XDG_CACHE_HOME/go/mod";
      ANSIBLE_CONFIG="$XDG_CONFIG_HOME/ansible/ansible.cfg";
      UNISON="$XDG_DATA_HOME/unison";
      HISTFILE="$XDG_DATA_HOME/history";
      MBSYNCRC="$XDG_CONFIG_HOME/mbsync/config";
      ELECTRUMDIR="$XDG_DATA_HOME/electrum";
      PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc";
      SQLITE_HISTORY="$XDG_DATA_HOME/sqlite_history";

      # Other program settings:
      # DICS="/usr/share/stardict/dic/";
      # SUDO_ASKPASS="$HOME/.local/bin/dmenupass";
      # FZF_DEFAULT_OPTS="--layout=reverse --height 40%";
      # LESS=-R;
      # LESS_TERMCAP_mb="$(printf '%b' '[1;31m')";
      # LESS_TERMCAP_md="$(printf '%b' '[1;36m')";
      # LESS_TERMCAP_me="$(printf '%b' '[0m')";
      # LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')";
      # LESS_TERMCAP_se="$(printf '%b' '[0m')";
      # LESS_TERMCAP_us="$(printf '%b' '[1;32m')";
      # LESS_TERMCAP_ue="$(printf '%b' '[0m')";
      # LESSOPEN="| /usr/bin/highlight -O ansi %s 2>/dev/null";
      # QT_QPA_PLATFORMTHEME="gtk2"; # Have QT use gtk2 theme.
      # MOZ_USE_XINPUT2="1"; # Mozilla smooth scrolling/touchpads.
      # AWT_TOOLKIT="MToolkit wmname LG3D"; # May have to install wmname
      # _JAVA_AWT_WM_NONREPARENTING=1; # Fix for Java applications in dwm
    };

  };

programs.fzf = {
  package = pkgs.fzf;
  enable = true;
  enableFishIntegration = true;
  enableBashIntegration = true;
};

programs.mpv = {
  enable = true;
  #scripts = [ pkgs.mpvScripts.sponsorblock pkgs.mpvScripts.webtorrent-mpv-hook pkgs.mpvScripts.thumbnail pkgs.mpvScripts.mpris ];
  scripts = [ pkgs.mpvScripts.sponsorblock pkgs.mpvScripts.webtorrent-mpv-hook pkgs.mpvScripts.thumbfast pkgs.mpvScripts.mpris ];
};

programs.starship = {
  enable = true;
  enableFishIntegration = true;
  enableBashIntegration = true;
  enableTransience = true;
};

programs.ncmpcpp = {
  enable = true;
  #mpdMusicDir= "~/Music";
  bindings = [
    { key = "j"; command = "scroll_down"; }
    { key = "k"; command = "scroll_up"; }
    { key = "J"; command = [ "select_item" "scroll_down" ]; }
    { key = "K"; command = [ "select_item" "scroll_up" ]; }
    { key = "v"; command = "show_visualizer"; }
  ];
};

programs.java.enable = true;

  services.mpd = {
    enable = true;
    musicDirectory = "~/Music";
  };

  services.syncthing.enable = true;
  services.syncthing.tray.enable = true;

  #services.mullvad-vpn.enable = true;

  #services.gvfs.enable = true; # Mount, trash, and other functionalities
  #services.tumbler.enable = true; # Thumbnail support for images

  services.home-manager.autoUpgrade.frequency = "weekly";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
