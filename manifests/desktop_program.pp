define gnome::desktop_program(
  $entryName = $title,
  $exec = "",
  $icon
){

  $user = $::gnome::params::user
  $homeDir = "/home/$user"

  $applicationDir = "$homeDir/.local/share/applications"


  
  if empty($exec) {
    $command = $entryName
  } else {
    $command = $exec
  }
  
  exec { "create dir for $command " :
    command => "mkdir -p $applicationDir",
    user    => $user,
    onlyif  => ["test -d $applicationDir"],
  }

  -> gnome::desktop_entry { "$applicationDir/$entryName.desktop" :
    exec        => $command,
    entryName   => $entryName,
    icon        => $icon,
  }

}
