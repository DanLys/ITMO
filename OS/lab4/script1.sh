#!bin/bash
if [ ! -d ~/.trash ]; then
	mkdir ~/.trash
fi
	
if [ -f $1 ]; then
	file=$(date '+%d.%m.%y_%H:%M:%S')
	ln $1 ~/.trash/$file
	echo "$(realpath $1):$file" >> ~/.trash.log
	rm $1
fi
