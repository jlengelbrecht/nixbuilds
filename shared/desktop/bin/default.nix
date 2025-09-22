{ pkgs, ... }:
let
  changeWallpaper = import ./change_wallpaper.nix { inherit pkgs; };
  selectWallpaper = import ./select_wallpaper.nix { inherit pkgs; };
  startup = import ./startup.nix { inherit pkgs; };
in
[
  changeWallpaper
  selectWallpaper
  startup
]
