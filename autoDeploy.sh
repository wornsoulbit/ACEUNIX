#!/bin/bash

#In order for this script to work you need to be in your local git repository (ACEUNIX directory)

upToDateMessage=$(git pull)


if ! [[ $upToDateMessage == "Already up to date." ]];
then
	echo $(touch "testfile.txt")
	echo $(git add *)
	echo $(git commit -m "testing")
	echo $(git push)
	#(1)build website
	#(2)copy static files to the correct location 
fi	
