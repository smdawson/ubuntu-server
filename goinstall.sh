#!/bin/bash
#set -e
#
##########################################################
#                                                        #
#          Golang Ubuntu Server Install Script           #
#         m0bat's Automatic Installation Script          #
#       Appllicatoins used for Bug Bounty Hunting        #
#                                                        #
##########################################################
#  +FIRST  : sudo chmod +x goinstall.sh                  #
#                (Give EXEC Access To Script)            #
#  +TO RUN    : ./goinstall.sh                           #
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
        echo 'export GOPATH=$HOME/go'   >> ~/.profile
        echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.profile
        . ~/.profile
        echo -e " [${g}✔${endc}]::${bu}${b}[golang 1.16.3]${enda}${endc} Installed!"
        sleep 5
fi
