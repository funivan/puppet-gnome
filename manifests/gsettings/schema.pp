define gnome::gsettings::schema(
  $schema = $title,
  $values,
  $resetKeys = false,
) {
  # @todo set values from ararys
  $command = inline_template("<% @values.each do |key, value| %>
  gsettings set $schema <%= key %> <%= (value.class == String) ? (\"'\" + value + \"'\") : value %>;<% end %>")

  if $resetKeys {
    gnome::gsettings::resetKeys{ $schema: } -> gnome::gsettings::command{ $command: }
  } else{
    gnome::gsettings::command{ $command: }
  }

}