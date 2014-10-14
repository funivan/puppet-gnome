# Gnome module for Puppet

## Description
Configure settings via gsettings provider. 

## Usage

### gnome::gsettings
Force a package to be installed from a specific release.  Useful when using repositoires like Debian unstable in Ubuntu.
```
gnome::gsettings {'org.gnome.settings-daemon.plugins.media-keys':
 values => {
   screenshot => "<Super>Print",
   area-screenshot "['disabled']",
 },
}
```
