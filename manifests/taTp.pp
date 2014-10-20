define gnome::taTp(
  $program = $title
) {

  exec { "echo $program": }
}
