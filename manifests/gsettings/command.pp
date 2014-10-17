define gnome::gsettings::command(
  $command=$title,
  $output=false,
){
		exec { $command:
			command => "
				PID=$(pgrep gnome-session);
				echo 'pid'
				echo \$PID
				export DBUS_SESSION_BUS_ADDRESS=$(grep -z DBUS_SESSION_BUS_ADDRESS /proc/\$PID/environ|cut -d= -f2-);
				export DISPLAY=:0;
				export GSETTINGS_BACKEND=dconf;
				$command
			",
			user => $userName,
		}
	}