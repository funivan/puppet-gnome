#
# Variables:
# $userName
#
#
#

# configure default gnome settings
	define gsettings::command($command=$title, $output=false){
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
            
	define gsettings::set($command=$title, $output=false){
		gsettings::command{"gsettings set $command":}
	}

	define gsettings::resetKeys($schema=$title){
			gsettings::command { "
				for id in \$(gsettings list-keys $schema); do
					info=`gsettings get $schema \$id | egrep \"(Alt|Ctrl|Shift|Super|Primary)\"`;
					if [ ! -z \"\$info\" ] ; then
						gsettings set $schema \$id \"['disabled']\"
						echo 'disable '\$id
					fi;
				done
			":
		}
	}
            



#define gnome::gsettings(
#  $schema = $title,
#  $values,
#  $directory = '/usr/share/glib-2.0/schemas',
#  $priority  = '25',
#	) {
#		file { "${directory}/${priority}_${schema}.gschema.override":
#			content => template("gnome/schema.erb"),
#		}
#		~>
#		exec { "/usr/bin/glib-compile-schemas ${directory} --strict":
#			refreshonly => true,
#		}
#}
#