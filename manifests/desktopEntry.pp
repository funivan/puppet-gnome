define gnome::desktopEntry(
  $file=$title,
  $name,
  $exec="",
  $genericName="",
  $comment="",
  $terminal="false",
  $appType="Application",
  $icon="folder",
  $categories="",
  $startupNotify="false") {

  file { $file:
    content => template("gnome/desktop.erb"),
  }
}
