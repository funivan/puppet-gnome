define gnome::gsettings::set(
	$command=$title, $output=false
){
		gnome::gsettings::command{"gsettings set $command":}
}
