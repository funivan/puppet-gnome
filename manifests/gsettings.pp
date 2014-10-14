# gsettings.pp
# configure default gnome settings

define gnome::gsettings(
  $schema = $title,
  $values,
  $directory = '/usr/share/glib-2.0/schemas',
  $priority  = '25',
	) {
		file { "${directory}/${priority}_${scheme}.gschema.override":
			content = template("gnome/schema.erb"),
		}
		~>
		exec { "/usr/bin/glib-compile-schemas ${directory} --strict":
			refreshonly => true,
		}
}
