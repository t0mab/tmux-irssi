tmux-irssi
==========

See https://wiki.archlinux.org/index.php/irssi#irssi_with_nicklist_in_tmux

Requirements irssi properly configured & http://scripts.irssi.org/scripts/nicklist.pl

To install as a systemd service
(edit tmuxirssi.service first!!!)

$ sudo cp archlinux/tmuxirssi.service /usr/lib/systemd/system/
$ sudo systemctl enable tmuxirssi
