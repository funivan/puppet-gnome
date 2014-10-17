# Gnome module for Puppet


## Description
Configure settings via gsettings provider. 

## Usage



## Install development version
```
./build.sh && puppet module install funivan-gnome-0.1.0.tar.gz --ignore-dependencies
```





### @todo gnome::gsettings
Try to use new syntax 
```
gnome::gsettings {'org.gnome.settings-daemon.plugins.media-keys':
 values => {
   screenshot => "<Super>Print",
   area-screenshot => "['disabled']",
 },
}
```