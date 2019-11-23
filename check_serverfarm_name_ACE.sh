#!/usr/bin/expect -f
        set timeout 20
        set IPaddress [lindex $argv 0]
        set Username "[username]"
        set Password "[password]"
        set Directory /usr/local/bin/checks_ace/logs/logs_conn
        spawn ssh -o "StrictHostKeyChecking no" $Username@$IPaddress
        expect "*assword: "
        send "$Password\r"
        expect "#"
        send "changeto [context_name]\r"
        expect "[context_name]#"
        log_file -a $Directory/serverfarms_detail_$IPaddress.log
        send "terminal length 0\r"
        expect "#"
        send "show serverfarm detail\r"
        expect "#"
        sleep 2
        send "exit\r"
        sleep 1
exit
