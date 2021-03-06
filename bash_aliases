alias compile='mvn compile -Pdeveloper -Dmaven.wagon.http.ssl.insecure=true -Dmaven.wagon.http.ssl.allowall=true'

alias Ccompile='mvn clean compile -Pdeveloper -Dmaven.wagon.http.ssl.insecure=true -Dmaven.wagon.http.ssl.allowall=true'

alias shutdown='sudo shutdown –h now'    #requires root password, disable it by "sudo chmod u+s /sbin/shutdown"

alias restart='sudo shutdown –r now'      #requires root password, disable it by "sudo chmod u+s /sbin/shutdown"

alias suspend='systemctl suspend'

alias lock='gnome-screensaver-command --lock'

#drop, create, and deploy DB
alias dropCreateSpark='mysql -uroot -p spark -e "drop database spark; create database spark;"'
alias poblarSpark='gunzip -c spark-nightly.dmp.gz | mysql -uroot -p spark'

alias dropCreateScorm='mysql -uroot -p scorm -e "drop database scorm; create database scorm;"'
alias poblarScorm='gunzip -c scorm-nightly.dmp.gz | mysql -uroot -p scorm'

alias dropCreateQuartz='mysql -uroot -p quartz -e "drop database quartz; create database quartz;"'
alias poblarQuartz='gunzip -c quartz-nightly.dmp.gz | mysql -uroot -p quartz'

alias myip='wget http://ipinfo.io/ip -qO -'

alias cdtool='cd /home/andreshazard/Dropbox/Tools'

alias vi='vim'
alias vim='gvim -v'

alias cl='clear'

alias pmp='cd ~/Dropbox/Tools/pmpScript/ && python2 main.py && cd - > /dev/null'

#Navigate up the directory using ..n removing becuase of zsh
#alias ..='cd ..'
#alias ..2='cd ../..'
#alias ..3='cd ../../..'
#alias ..4='cd ../../../..'
#alias ..5='cd ../../../../..'

#Start and stop services
alias startDocker='sudo systemctl start docker.service'
alias stopDocker='sudo systemctl stop docker.service'
alias startMysql='sudo systemctl start mysqld.service'
alias stopMysql='sudo systemctl stop mysqld.service'

alias ll='ls -alFh'
