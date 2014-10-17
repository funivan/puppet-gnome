#!/usr/bin/env zsh

	name="funivan-gnome"
	version="0.0.1"
	file="$name-$version.tar.gz" 

 	dir=$(basename `pwd`)
 
 	rm $file;
 	cd ../

 	echo $dir;
 	tar  --transform "s/^./$name-$version/" -czvf $file $dir/*  
 	cd $dir;
 	mv ../$file $file;
  ls /etc/puppet/modules/
