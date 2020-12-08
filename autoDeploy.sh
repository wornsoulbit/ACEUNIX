#!/bin/bash

#In order for this script to work you need to be in your local git repository (ACEUNIX directory)

upToDateMessage=$(git pull)


if ! [[ $upToDateMessage == "Already up to date." ]];
then
	#(1)building site
	echo $(cd jekyll-theme-chirpy)
	echo $(bundle exec jekyll build)
	#(2)copy static files to the correct location
	echo $(sudo cp -R _site/* /var/www/html)
fi	
