{ pkgs, ... }:
{
  imports = [
    ../../shared/shell/zsh.nix
    ../../shared/ssh.nix
    ../../shared/git.nix
    ../../shared/desktop/dev
    ../../shared/desktop
  ];

  desktop.enable = true;

  wayland.windowManager.hyprland.extraConfig = ''
    # Monitor settings
    monitor=DP-3, 5120x1440@240, 0x1080, 1.15
    monitor=DP-2, 3840x1080@144, 3625x0, 1
    monitor=DP-1, 3840x2160@144, 4453x1080, 1.7
  '';

  home = {
    # This value determines the Home Manager release that your configuration is
    # compatible with. This helps avoid breakage when a new Home Manager release
    # introduces backwards incompatible changes.
    #
    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    stateVersion = "24.11";

    packages =
      with pkgs;
      [
        # Desktop
        swww
        dunst
        libnotify
        brightnessctl
        grimblast

        # Sound
        pwvucontrol
        pulseaudio

        # Networking
        networkmanagerapplet
        networkmanager

        # File managers
        xfce.thunar
        xfce.thunar-volman
        yazi
        gparted

        # Browser
        chromium
        firefox-wayland
        librewolf

        # Other gui apps
        thunderbird
        _1password-gui

        # Music
        mpv
        youtube-music

        # Video
        ffmpeg
        vlc
        obs-studio

        ## Video editing
        #kdePackages.kdenlive

        # Image
        imagemagick
        mupdf
        feh
        gimp
        satty

        # Social media
        vesktop
        bemoji

        # Bluetooth
        bluez
        blueman

        # Games
        lutris
        godot3
        steam
        appimage-run
        pokemmo-installer
        osu-lazer-bin
        prismlauncher
        mgba

        ## Drivers/Requirements
        wacomtablet
        opentabletdriver
        ckb-next
        meson
        wine
        winetricks
        wine-wayland
        zlib
        lego
        android-udev-rules
        android-studio

        # Miscs
        cpu-x
        marp-cli
      ]
      ## Install custom scripts
      ++ (import ./../../shared/desktop/bin { inherit pkgs; });

    # For env var
    sessionVariables = {
      EDITOR = "nvim";
      NIX_AUTO_RUN = 1;
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
