#!/bin/bash

#In order for this script to work you need to be in your local git repository (ACEUNIX directory)

$(git pull)


if [[ `git status --porcelain` ]];
then
	$(touch file.txt)
	#(1)build website
	#(2)copy static files to the correct location 
fi	
