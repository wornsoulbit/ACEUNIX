#!/bin/bash

#Going to home directory
cd /home/debian/ACEUNIX/

#Getting the message from the git pull command
upToDateMessage=$(git pull)

if ! [[ $upToDateMessage == "Already up to date." ]];
then
	#(1)building site
	cd /home/debian/ACEUNIX/jekyll-theme-chirpy
	bundle exec jekyll build
	#(2)copy static files to the correct location
	sudo rsync -r _site/* /var/www/html
fi	
