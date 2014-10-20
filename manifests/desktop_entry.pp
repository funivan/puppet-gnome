define gnome::desktop_entry(
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
    owner  => $::gnome::params::user,
    mode   => 0755
  }
}
