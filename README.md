# Periwinkle
**The cutest MPD client.**

Periwinkle is a fully-fledged MPD client that uses netcat to communicate with the MPD server directly, and libnotify + dmenu to control it, although you can also control Periwinkle through the CLI. For a shell script, I'd say it's surprisingly fast.
It can also be used as a NCMPCPP notify-info or as a standalone daemon to notify when a song changes without a client open.

# Contributors
**Barrucadu** - https://bbs.archlinux.org/viewtopic.php?id=78311

ChatGPT - Some of the code is AI generated, but that shouldn't take away from it's quality and purpose really.

This will be good to analize later on to make independent Bash programs, I'm still learning and this will be good to learn from.

# Install
Clone this repo and run `make install` without sudo.

To activate the daemon with systemd, type `systemctl --user start periwinkle-daemon` or enable it using `systemctl --user enable periwinkle-daemon` to make it run every time you boot up the computer.

I'm only putting it on the internet because maybe there's people that will find this useful.
