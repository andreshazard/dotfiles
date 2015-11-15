alias compile='mvn compile -Pdeveloper -Dmaven.wagon.http.ssl.insecure=true -Dmaven.wagon.http.ssl.allowall=true'

alias Ccompile='mvn clean compile -Pdeveloper -Dmaven.wagon.http.ssl.insecure=true -Dmaven.wagon.http.ssl.allowall=true'

alias upgrade='sudo dnf upgrade'

alias intelij='/home/andreshazard/Downloads/Tools/idea-IC-143.382.35/bin./idea.sh &'

alias 0xdbe='/home/andreshazard/Downloads/Tools/./0xdbe.sh &'

alias superbeam='/home/andreshazard/Downloads/superbeam/./start-superbeam.sh &'

alias shutdown='sudo shutdown –h now'    #requires root password, disable it by "sudo chmod u+s /sbin/shutdown"

alias restart='sudo shutdown –r now'      #requires root password, disable it by "sudo chmod u+s /sbin/shutdown"

alias suspend='systemctl suspend'

alias lock='gnome-screensaver-command --lock'

alias dropCreateSpark='mysql -uroot -p spark -e "drop database spark; create database spark;"'
alias poblarSpark='gunzip -c spark-nightly.dmp.gz | mysql -uroot -p spark'

alias dropCreateScorm='mysql -uroot -p scorm -e "drop database scorm; create database scorm;"'
alias poblarScorm='gunzip -c scorm-nightly.dmp.gz | mysql -uroot -p scorm'

alias dropCreateQuartz='mysql -uroot -p quartz -e "drop database quartz; create database quartz;"'
alias poblarQuartz='gunzip -c quartz-nightly.dmp.gz | mysql -uroot -p quartz'

alias myip='wget http://ipinfo.io/ip -qO -'
