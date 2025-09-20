{ pkgs, ... }:
pkgs.writeShellScriptBin "change_wallpaper" ''
  file=$(ls /home/devbox/nixbuilds/shared/desktop/wallpaper/ | shuf -n 1)
  swww img /home/devbox/nixbuilds/shared/desktop/wallpaper/$file --transition-step 10 --transition-fps 30 --transition-type center &
  wal -i /home/devbox/nixbuilds/shared/desktop/wallpaper/$file &
  sleep 0.2
  cp ~/.cache/wal/cava_conf ~/.config/cava/config &
  [[ $(pidof cava) != "" ]] && pkill -USR1 cava &
''