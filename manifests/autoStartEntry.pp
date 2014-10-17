
define gnome::autoStartEntry($entryName = $title, $exec) {

  gnome::desktopEntry { "$homeDir/.config/autostart/$entryName.desktop" :
    exec => $exec,
    name => $entryName,
  }

}
