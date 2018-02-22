#!/usr/bin/bash

#
#  Based on https://wiki.archlinux.org/index.php/irssi#irssi_with_nicklist_in_tmux
#  needs http://scripts.irssi.org/scripts/nicklist.pl
#

# Ugly fix but working for my needs for now !
# export TERM=xterm-256color
# T3=$(pgrep -u $USER -x irssi)
#
# irssi_nickpane() {
#     tmux setw main-pane-width $(( $(tput cols) - 21));
#     tmux splitw -v "cat ~/.irssi/nicklistfifo";
#     tmux selectl main-vertical;
#     tmux selectw -t irssi;
#     tmux selectp -t 0;
# }
#
# irssi_repair() {
#     tmux selectw -t irssi
#     (( $(tmux lsp | wc -l) > 1 )) && tmux killp -a -t 0
#     irssi_nickpane
# }
#
# if [ -z "$T3" ]; then
#     tmux new-session -d -s irc;
#     tmux new-window -t irc -n irssi irssi;
#     irssi_nickpane ;
# fi
#     tmux attach-session -d -t irc;
#     irssi_repair ;
# exit 0


T3=$(pgrep -u $USER -x irssi)

irssi_nickpane() {
    tmux setw main-pane-width $(( $(tput cols) - 21));
    tmux splitw -v "cat ~/.irssi/nicklistfifo";
    tmux selectl main-vertical;
    tmux selectw -t irssi;
    tmux selectp -t 0;
}

irssi_repair() {
    tmux selectw -t irssi
    (( $(tmux lsp | wc -l) > 1 )) && tmux killp -a -t 0
    irssi_nickpane
}

if [ -z "$T3" ]; then
    tmux new-session -d -s main;
    tmux new-window -t main -n irssi irssi;
    irssi_nickpane ;
fi
    tmux attach-session -d -t main;
    irssi_repair ;
exit 0
