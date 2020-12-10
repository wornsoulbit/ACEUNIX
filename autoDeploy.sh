#!/bin/bash

#In order for this script to work you need to be in your local git repository (ACEUNIX directory)

cd /home/debian/ACEUNIX/

upToDateMessage=$(git pull)


if ! [[ $upToDateMessage == "Already up to date." ]];
then
	#(1)building site
	cd /home/debian/ACEUNIX/jekyll-theme-chirpy
	bundle exec jekyll build
	#(2)copy static files to the correct location
	sudo rsync -r home/debian/ACEUNIX/jekyll-theme-chirpy/_site/* /var/www/html
fi	
