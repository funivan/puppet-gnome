define gnome::gsettings::reset_keys($schema=$title){
  gnome::gsettings::command { "
				for id in \$(gsettings list-keys $schema); do
					info=`gsettings get $schema \$id | egrep \"(Alt|Ctrl|Shift|Super|Primary)\"`;
					if [ ! -z \"\$info\" ] ; then
						gsettings set $schema \$id \"['disabled']\"
						echo 'disable' \$id
					fi;
				done
			":
  }
}