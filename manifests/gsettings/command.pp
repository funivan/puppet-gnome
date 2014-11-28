define gnome::gsettings::command(
  $command=$title,
){

	validate_string($::gnome::params::user)
	validate_bool($::gnome::params::logoutput)
	
  exec { $command:
    command   => "$command",
    user      => $::gnome::params::user,
    logoutput => $::gnome::params::logoutput
  }

}