#!/bin/bash
#set -e
#
##########################################################
#                                                        #
#        Bug Bounty Ubuntu Server Install Script         #
#         m0bat's Automatic Installation Script          #
#       Appllicatoins used for Bug Bounty Hunting        #
#                                                        #
##########################################################
#  +FIRST  : sudo chmod +x ubuntu-apps_*.sh              #
#                (Give EXEC Access To Script)            #
#  +TO RUN    : ./ubuntu-apps_*.sh                       # 
#                                                        #
##########################################################
#                                                        #
#                DO NOT JUST RUN THIS.                   #
#       EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.         #
#                                                        #
##########################################################
#
#
#  TO DO:
#
#
######################## Variables #######################
#
# b=bold u=underline bl=black r=red g=green
# y=yellow bu=blue m=magenta c=cyan w=white
# endc=end-color enda=end-argument
b='\033[1m'
u='\033[4m'
bl='\E[30m'
r='\E[31m'
g='\E[32m'
y='\E[33m'
bu='\E[34m'
m='\E[35m'
c='\E[36m'
w='\E[37m'
endc='\E[0m'
enda='\033[0m'
version="20210412"

####################### Functions ########################


##########################################################
#update
sudo apt-get -y update
sudo apt-get -y upgrade

#initial installs
sudo apt-get install -y git unzip
sudo apt-get install -y python3-pip
sudo apt-get install -y python-pip

#clone SecLists
mkdir ~/git/
cd ~/git/
git clone https://github.com/danielmiessler/SecLists.git

#make tools directory
mkdir ~/tools
cd ~/tools/

#install go
if [[ -d "$GOROOT" ]]; then
	echo -e " [${g}✔${endc}]::${y}${b}[Golang]${enda}${endc} Is Already Installed!"
	sleep 1
else 	
	echo -e " [${r}!${endc}]::Installing ${y}${b}[Golang 1.16.3]${enda}${endc}"
	cd ~
	curl -O https://dl.google.com/go/go1.16.3.linux-amd64.tar.gz
	sudo tar -xvf go1.16.3.linux-amd64.tar.gz
	sudo chown -R root:root ./go
	sudo mv go /usr/local
	export GOROOT=/usr/local/go
	export GOPATH=$HOME/go
	export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
	echo 'export GOROOT=/usr/local/go' >> ~/.profile
	echo 'export GOPATH=$HOME/go'	>> ~/.profile			
	echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.profile	
	. ~/.profile
	echo -e " [${g}✔${endc}]::${bu}${b}[golang 1.16.3]${enda}${endc} Installed!"
	sleep 5
fi

#install FFUF
echo -e " [${r}!${endc}]::Installing ${y}${b}[ffuf]${enda}${endc}"
go get -u github.com/ffuf/ffuf
echo -e " [${g}✔${endc}]::${bu}${b}[ffuf]${enda}${endc} Installed!"
sleep 5

#install nmap
echo -e " [${r}!${endc}]::Installing ${y}${b}[nmap]${enda}${endc}"
sudo apt-get install -y nmap
echo -e " [${g}✔${endc}]::${bu}${b}[nmap]${enda}${endc} Installed!"
sleep 5

#install sublist3r
echo -e " [${r}!${endc}]::Installing ${y}${b}[Sublist3r]${enda}${endc}"
cd ~/tools/
git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r
sudo pip3 install -r requirements.txt
cd ~/tools/
echo -e " [${g}✔${endc}]::${bu}${b}[Sublist3r]${enda}${endc} Installed!"
sleep 5

#install Amass
echo -e " [${r}!${endc}]::Installing ${y}${b}[Amass]${enda}${endc}"
sudo snap install amass
echo -e " [${g}✔${endc}]::${bu}${b}[Amass]${enda}${endc} Installed!"
sleep 5

#install aquatone
echo -e " [${r}!${endc}]::Installing ${y}${b}[Aquatone]${enda}${endc}"
cd ~/tools/
wget https://github.com/michenriksen/aquatone/releases/download/v1.7.0/aquatone_linux_amd64_1.7.0.zip
unzip aquatone_linux_amd64_1.7.0.zip
sudo cp aquatone /usr/local/bin
echo -e " [${g}✔${endc}]::${bu}${b}[Aquatone]${enda}${endc} Installed!"
sleep 5

#install chromium
echo -e " [${r}!${endc}]::Installing ${y}${b}[Chromium]${enda}${endc}"
sudo snap install chromium
echo -e " [${g}✔${endc}]::${bu}${b}[Chromium]${enda}${endc} Installed!"
sleep 5

#install httprobe
echo -e " [${r}!${endc}]::Installing ${y}${b}[httprobe]${enda}${endc}"
go get -u github.com/tomnomnom/httprobe 
echo -e " [${g}✔${endc}]::${bu}${b}[httprobe]${enda}${endc} Installed!"
sleep 5
