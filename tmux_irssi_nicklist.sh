#!/usr/bin/env bash

#
#  Based on https://wiki.archlinux.org/index.php/irssi#irssi_with_nicklist_in_tmux
#  needs http://scripts.irssi.org/scripts/nicklist.pl
#

T3=$(pgrep -u $USER -x irssi)

irssi_nickpane() {
    tmux setw main-pane-width $(( $(tput cols) - 21));
    tmux splitw -v "cat ~/.irssi/nicklistfifo";
    tmux selectl main-vertical;
    tmux selectw -t irc;
    tmux selectp -t 0;
    tmux send-keys -t 0 "/nicklist fifo" C-m;
}

irssi_repair() {
    tmux selectw -t irc
    (( $(tmux lsp | wc -l) > 1 )) && tmux killp -a -t 0
    irssi_nickpane
}

if [ -z "$T3" ]; then
    tmux new-session -d -s irc;
    tmux new-window -t irc -n irc irssi;
    irssi_nickpane ;
fi
    tmux attach-session -d -t irc;
    irssi_repair ;
exit 0
