{ pkgs, ... }:
let
  # change wallpaper
  change_wallpaper = import ./change_wallpaper.nix { inherit pkgs; };
  select_wallpaper = import ./select_wallpaper.nix { inherit pkgs; };
  startup = import ./startup.nix { inherit pkgs; };
in
[
  change_wallpaper
  select_wallpaper
  startup
]