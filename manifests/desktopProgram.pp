# Variables : 
# $userName
# $homeDir
#
# gnome::desktopProgram  {  [ "idea" ]:
#   path => "$HOME/programs/ideaIC/bin/idea.sh",
#   icon => "$HOME/programs/ideaIC/bin/idea.png",
# }
#

define gnome::desktopProgram($program = $title, $path, $icon) {
  file { ["/usr/local/bin/$program" ]:
    ensure => link,
    target => "$path",
  } -> exec { "echo $program && mkdir -p $homeDir/.local/share/applications/" :
    user => $userName,
  } -> gnome::desktopEntry { [
    "$homeDir/.local/share/applications/$program.desktop"
  ] :
    exec   => "$program",
    name   => "$program",
    icon   => "$icon",
  }

}
