define gnome::autostart_entry(
  $entryName = $title,
  $exec = ''
) {


  $user = $::gnome::params::user
  $homeDir = "/home/$user"

  if empty($exec) {
    $execute = $entryName
  } else {
    $execute = $exec
  }

  $autostartDir = "$homeDir/.config/autostart"

  exec { "create autostart dir for $entryName ":
    command => "mkdir -p $autostartDir",
    user    => $user,
    onlyif  => ["test ! -d $autostartDir"]
  }
  ->
  gnome::desktop_entry { "$homeDir/.config/autostart/$entryName.desktop" :
    exec => $execute,
    entryName => $entryName,
  }

}
