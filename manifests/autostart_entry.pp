define gnome::autostart_entry(
  $entryName = $title,
  $exec
) {


  $user = $::gnome::params::user
  $homeDir = "/home/$user"

  exec { "mysql_autostart dir for $entryName ":
    command => "mkdir -p $homeDir/.config/autostart",
    user => $user,
  }
  ->
  gnome::desktop_entry { "$homeDir/.config/autostart/$entryName.desktop" :
    exec => $exec,
    name => $entryName,
  }

}
