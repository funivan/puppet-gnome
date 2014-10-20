define gnome::desktop_program(
  $program = $title,
  $path,
  $icon
){

  $user = $::gnome::params::user
  $homeDir = "/home/$user"

  file { ["/usr/local/bin/$program" ]:
    ensure => link,
    target => "$path",
  }
  ->
  file { ["$homeDir/.local/", "$homeDir/.local/share", "$homeDir/.local/share/applications"] :
    ensure => directory,
    owner  => $::gnome::params::user,
  } -> gnome::desktopEntry { "$homeDir/.local/share/applications/$program.desktop" :
    exec   => "$program",
    name   => "$program",
    icon   => "$icon",
  }

}
