define gnome::desktop_program(
  $program = $title,
  $path,
  $icon
){

  $user = $::gnome::params::user
  $homeDir = "/home/$user"

  $applicationDir = "$homeDir/.local/share/applications"


  file { "/usr/local/bin/$program":
    ensure => link,
    target => "$path",
  }

  -> exec { "create dir for $program " :
    command => "mkdir -p $applicationDir",
    user    => $user,
    onlyif  => ["test -d $applicationDir"],
  }

  -> gnome::desktop_entry { "$applicationDir/$program.desktop" :
    exec        => $program,
    entryName   => $program,
    icon        => $icon,
  }

}
