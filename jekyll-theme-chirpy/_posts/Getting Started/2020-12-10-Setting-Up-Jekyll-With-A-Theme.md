---
title: Setting up Jekyll with a theme
date: 2020-12-10 16:14:04 -0500
categories: [Getting Started]
tags: [setup, getting_started, installation]
toc: true
---

## Setting up a Jekyll static website

	1. sudo apt-get install ruby-full if ruby isn't already installed, you can check if ruby 
	is installed by doing ruby -v to see the version currently installed.

	2. gem install jekyll bundler. 

	3. If you want to create a local site from scratch what you do is: jekyll new "folder_name" 
	and it'll create a new jekyll site at ./folder_name, if you want to use a custom theme, 
	download the theme you want from either jekyllthemes.org or another similar site. 
	Unzip it then in the folder do gem install.

	4. To actually see how your static site looks like you have to do, bundle exec jekyll serve. 
	You can see how the site looks at http://localhost:4000 or you can change it by going to the 
	_config.yml and adding port:(any number) and you can do http://localhost:(port number).

	5. Once you have created the site you want on your local machine, you can transfer it over to 
	the server either by SCP or github if you do decided to use github, find a proper .gitignore 
	for jekyll as there are many files that aren't needed in the remote repository. To copy the 
	file from your local machine into the VPS without using git, would be done with SCP, 
	initially zip the file your going to send over using zip -r file_name.zip file_path, this 
	command will created a compressed file with the given file_name, then to send that compressed 
	file to the server, which would be done as followed: 
	scp /file_path username@IpAddress:/destination_path.

	6. Once the file is sent over to the VPS, you'll want to install unzip as it's likely that it's 
	not installed by default, to get it do sudo apt-get install unzip. Once you have that installed 
	just go into the directory you sent the file, and do unzip file_name.zip.

	7. Once you have the Jekyll site on the server instead of running bundle exec jekyll serve 
	you'll run a similar command, bundle exec jekyll build, this command will build the _site 
	folder without running a local copy of the site on the server.

	8. Once you built the _site folder, you'll want to copy the contents of it into /var/www/html, 
	to do so do the following command: sudo cp -r _sitePath /var/www/html.
