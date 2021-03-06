# Gnome module for Puppet


## Description
Configure settings via gsettings provider. 

## Usage

### Schema
```
 gnome::gsettings::schema{ "org.gnome.desktop.wm.keybindings":
    reset_keys => true, 
    values    => {
      'switch-to-workspace-left'=>'["<Super>Left"]',
      'switch-to-workspace-right'=>'["<Super>Right"]',
      'switch-windows'=>'["<Alt>Tab"]',
      'switch-input-source'=>'["Caps_Lock"]',
      'close'=>'["<Alt>F4"]',
      'show-desktop'=>'["<Super>d"]'
    }
  }
```

`reset_keys` = reset keys with Alt|Ctrl|Shift|Super|Primary. By default reset_keys = false
     
```
 gnome::gsettings::schema{ "org.gnome.settings-daemon.peripherals.keyboard":
   values    => {
    'delay'=>180,
    'repeat-interval'=> 23
   }
 }
``` 
 
### Set
Set custom terminal
 
```
gnome::gsettings::set{ "org.gnome.desktop.default-applications.terminal exec 'terminator'": }
```

### Autostart applications

Start custom script
```
gnome::autostart_entry{ 'myScript':
  exec => '/bin/test-script.sh'
}
```


Start program
```
gnome::autostart_entry{ 'pidgin':
  exec => '/usr/bin/pidgin'
}
```

Or event simpler  
```
gnome::autostart_entry{ 'pidgin': }
```

 gnome::desktop_entry { "$homeDir/.config/autostart/$entryName.desktop" :
    exec => $exec,
    name => $entryName,
  }




## Install over librarian
Add to `Puppetfile`
```
mod 'funivan/gnome',
  :git => 'git://github.com/funivan/puppet-gnome.git'
```
