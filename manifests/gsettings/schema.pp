define gnome::gsettings::schema(
  $schema = $title,
  $values,
  $reset_keys = false,
) {

  $command = inline_template("<% @values.each do |key, value| %>
  gsettings set $schema <%= key %> <%= (value.class == String) ? (\"'\" + value + \"'\") : value %>;<% end %>")

  if $reset_keys {
    gnome::gsettings::reset_keys{ $schema: } -> gnome::gsettings::command{ $command: }
  } else{
    gnome::gsettings::command{ $command: }
  }

}