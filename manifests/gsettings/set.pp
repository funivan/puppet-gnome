define gnome::gsettings::set(
  $command=$title
){
  gnome::gsettings::command{ "gsettings set $command": }
}
