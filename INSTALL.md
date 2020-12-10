Installation Instruction:

Setting up VPS:

Go to https://www.ovhcloud.com/en-ca/vps/ to set up your person VPS. Select your plan (Operating system, datacentre, etc..).

Once your done. You should mark down the IP they provided to you.


From VPS to install nginx, do: 

A. Setting up SSH keys for your VPS:
	1. ssh-keygen -b 4096 by default it'll save the keypairs in the ~/.ssh directory.

	2. Go into the ~/.ssh folder and cat your public key, copy it with marking it then pressing right click.

	3. ssh into your VPS, with the RootUser@IpAddress.

	4. In the VPS once logged into it, cd in ~/.ssh.

	5. vim or nano the authorized keys file and right click to paste it into the document then save and quit from the file.

	6. At this point you should be able to log out of the VPS then log back into as Root 
	without having to enter any password at all.

	7. You can also add your ssh keys by going to "My services" in OVHcloud and add them from there.

B. Setting up Nginx:
	1. sudo apt-get install nginx on debian based systems, for other linux distros look online.

	2. systemctl status nginx.service to make sure the service is running. By default it should.


C. Setting up a Jekyll static website:
	1. sudo apt-get install ruby-full if ruby isn't already installed, you can check if ruby is installed by doing ruby -v to see the version currently installed.

	2. gem install jekyll bundler. 

	3. If you want to create a local site from scratch what you do is: jekyll new "folder_name" and it'll create a new jekyll site at ./folder_name, if you want to use a custom theme, download the theme you want from either jekyllthemes.org or another similar site. Unzip it then in the folder do gem install.

	4. To actually see how your static site looks like you have to do, bundle exec jekyll serve. You can see how the site looks at http://localhost:4000.

	5. Once you have created the site you want on your local machine, you can transfer it over to the server either by SCP or github if you do decided to use github, find a proper .gitignore for jekyll as there are many files that aren't needed in the remote repository. To copy the file from your local machine into the VPS without using git, would be done with SCP, initially zip the file your going to send over using zip -r file_name.zip file_path, this command will created a compressed file with the given file_name, then to send that compressed file to the server, which would be done as followed: scp /file_path username@IpAddress:/destination_path.

	6. Once the file is sent over to the VPS, you'll want to install unzip as it's likely that it's not installed by default, to get it do sudo apt-get install unzip. Once you have that installed just go into the directory you sent the file, and do unzip file_name.zip.

	7. Once you have the Jekyll site on the server instead of running bundle exec jekyll serve you'll run a similar command, bundle exec jekyll build, this command will build the _site folder without running a local copy of the site on the server.

	8. Once you built the _site folder, you'll want to copy the contents of it into /var/www/html, to do so do the following command: sudo cp -r _sitePath /var/www/html.