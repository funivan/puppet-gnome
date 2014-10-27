define gnome::desktop_program(
  $command = $title,
  $entryName = "",
  $fileName = "",
  $icon
){

  $user = $::gnome::params::user
  $homeDir = "/home/$user"

  $applicationDir = "$homeDir/.local/share/applications"


  
  if empty($entryName) {
    $applicationName = $command
  } else {
    $applicationName = $entryName
  }
  
  if empty($fileName) {
    $desktopFileName = $applicationName
  } else {
    $desktopFileName = $fileName
  }

  exec { "create dir for $command " :
    command => "mkdir -p $applicationDir",
    user    => $user,
    onlyif  => ["test -d $applicationDir"],
  }

  -> gnome::desktop_entry { "$applicationDir/$desktopFileName.desktop" :
    exec        => $command,
    entryName   => $applicationName,
    icon        => $icon,
  }

}
