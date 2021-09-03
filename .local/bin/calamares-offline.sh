#!/bin/bash

Main() {
    local mode=offline
    local progname="$(basename "$0")"
    local log=/home/liveuser/cachy-install.log

    cat <<EOF > $log
########## $log by $progname
########## Started (UTC): $(date -u "+%x %X")
########## Install mode: $mode

EOF
    RunInTerminal "tail -f $log" &

    sudo cp /usr/share/calamares/settings_${mode}.conf /usr/share/calamares/settings.conf
    pkexec calamares -style kvantum -c /usr/share/calamares/ -d >> $log
}

Main "$@"
