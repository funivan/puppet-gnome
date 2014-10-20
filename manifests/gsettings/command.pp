define gnome::gsettings::command(
  $command=$title,
){

	validate_string($::gnome::params::user)
	validate_bool($::gnome::params::logoutput)
	
  exec { $command:
    command   => "
				PID=$(pgrep gnome-session);
				echo \$PID;
				export DBUS_SESSION_BUS_ADDRESS=$(grep -z DBUS_SESSION_BUS_ADDRESS /proc/\$PID/environ|cut -d= -f2-);
				echo \$DBUS_SESSION_BUS_ADDRESS;
				export DISPLAY=0:0;
				export GSETTINGS_BACKEND=dconf;
				echo \$GSETTINGS_BACKEND;
				
				$command
			",
    user      => $::gnome::params::user,
    logoutput => $::gnome::params::logoutput
  }

}