alias compile='mvn compile -Pdeveloper -Dmaven.wagon.http.ssl.insecure=true -Dmaven.wagon.http.ssl.allowall=true'

alias Ccompile='mvn clean compile -Pdeveloper -Dmaven.wagon.http.ssl.insecure=true -Dmaven.wagon.http.ssl.allowall=true'

alias update='sudo apt-get update'

alias upgrade='sudo apt-get upgrade'

alias intelj='/home/andreshazard/Downloads/idea-IC-139.659.2/bin/./idea.sh &'

alias 0xdbe='/home/andreshazard/Downloads/0xDBE-139.795.5/bin/./0xdbe.sh &'

alias fakesmpt='cd /home/andreshazard/Downloads/ && sudo java -jar fakeSMTP-1.13.jar'

alias superbeam='/home/andreshazard/Downloads/superbeam/./start-superbeam.sh &'


alias shutdown='sudo shutdown –h now'    #requires root password, disable it by "sudo chmod u+s /sbin/shutdown"

alias restart='sudo shutdown –r now'      #requires root password, disable it by "sudo chmod u+s /sbin/shutdown"

alias suspend='sudo pm-suspend'

alias lock='gnome-screensaver-command --lock'

alias lyrics='bash /home/andreshazard/bin/spotyLyric.sh &'

alias gifscreen='/home/andreshazard/./byzanaz-gui &'

alias dropCreateSpark='mysql -uroot -p spark -e "drop database spark; create database spark;"' 
alias poblarSpark='gunzip -c spark-nightly.dmp.gz | mysql -uroot -p spark'

alias dropCreateScorm='mysql -uroot -p scorm -e "drop database scorm; create database scorm;"'
alias poblarScorm='gunzip -c scorm-nightly.dmp.gz | mysql -uroot -p scorm'

alias dropCreateQuartz='mysql -uroot -p quartz -e "drop database quartz; create database quartz;"'
alias poblarQuartz='gunzip -c quartz-nightly.dmp.gz | mysql -uroot -p quartz'

alias myip='wget http://ipinfo.io/ip -qO -'

alias lidOption='sudo /home/andreshazard/Downloads/Tools/lidBehaviourScript/lidScript.sh'
