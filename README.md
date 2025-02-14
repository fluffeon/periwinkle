# Periwinkle
**The cutest MPD client.** *(now Bash-free!!)*

Periwinkle is a fully-fledged MPD client that uses netcat to communicate with the MPD server directly, and libnotify + dmenu to control it, although you can also control Periwinkle through the CLI. For a shell script, I'd say it's surprisingly fast.
It can also be used as a NCMPCPP notify-info or as a standalone daemon to notify when a song changes without a client open.

# Dependencies

### Linux/BSD
- Netcat (either GNU Netcat or OpenBSD Netcat)
- notify-send
- awk (should come included in your core library of choice)
- ffmpeg
- dmenu

### macOS
- Netcat
- Alerter - https://github.com/vjeantet/alerter
- awk
- ffmpeg
- dmenu-mac - https://github.com/oNaiPs/dmenu-mac

# Config
Edit the `periwinkle` script directly to make changes. There are several to choose from inside of it.

```
# -------------------
# CONFIGURATION STUFF
# -------------------


# Here's the config for Periwinkle
# You'll have to change this before you do anything else

# ---
# MPD
# ---
#
# Choose where to point

#MPD_Host=localhost
#MPD_Port=6600

# Choose your music directory

#Directory_MusicFolder=$HOME/Music

# -----
# DMENU
# -----
#
# In dwm, usually the following equivalents for dmenu coloring are:
# Bar_Font = dmenufont
# Color_Background = col_gray1
# Color_Foreground = col_gray3
# Color_SelectedBackground = col_gray4
# Color_SelectedForeground = col_cyan

#Bar_Font="Sans Serif":size=10
#Color_Background=#5B544C
#Color_Foreground=#E4E3E0
#Color_SelectedBackground=#DA2A47
#Color_SelectedForeground=#E4E3E0

# Location of DMENU, if it's at the bottom or top.
# By default it's at the bottom

#Bar_Position=bottom

# ----------------
# PREVIEW SETTINGS
# ----------------
#
# Choose where to save the image previews

#Directory_AlbumCover=$HOME/periwinkle

# ---------------------
# NOTIFICATION SETTINGS
# ---------------------
#
# Notify timeout in seconds
# Set 0 for no timeout

#Notify_Timeout=5

# Show extra control buttons in the popup

#Notify_ExtraButtons=false

# Format the notification
# Set the appearance of the notification to your liking.
# Side note: %datep% is a variant of %date%, what it does is that if the metadata doesn't contain any date, it hides the parenthesis. Otherwise, if it contains a year, it shows them.

#Notify_TitlePlay="%stateicon% %title%"
#Notify_SubtitlePlay="%artist%\n%album% %datep%"

# Set the title to appear when the queue is completely stopped

#Notify_TitleStop="%stateicon% Stopped"

# Use formatting behavior from CLI, similar to previous versions of Periwinkle
# So what this does is basically when a song has no title, it displays the filename instead. And if there's no artist, it shows "Unknown Artist"
# By default, it's set on "false"

#Notify_FillEmptyTags=false

# ----------------
# PREVIEW SETTINGS
# ----------------
# 
# Choose the hash that you would like to use to save the image previews
# This is useful to keep every single album unique.
# For example, if you had Weezer self-titled albums with the same album name in their metadata, it should be able to differentiate them to show the correct album cover because they have a different metadata for the year and artist. If you have proper metadata for every album then it should work as expected
#
# Options: 
# none | md5 | sha256 | sha512 | base64
# The default is sha256

#UseHash=sha256
```

# Contributors
**Barrucadu** - https://bbs.archlinux.org/viewtopic.php?id=78311

ChatGPT - Some of the code is AI generated, but that shouldn't take away from it's quality and purpose really.

This will be good to analize later on to make independent Bash programs, I'm still learning and this will be good to learn from.

# Install
Clone this repo and run `make install` without sudo.

Make sure you have a POSIX-compatible shell. To change the shell that Periwinkle is gonna use, change the shebang at the beginning (default: /bin/sh).
Periwinkle can now even work on minimal shells like the **Debian Almquist shell** *(dash)*, wild! Still not fish-compliant, so sucks to be the like 5 people that use this shell unironically. If you really insist on it, [here's Periwinkle for the Fish shell.](https://github.com/fluffeon/periwinkle/tree/fish)

To activate the daemon with systemd, type `systemctl --user start periwinkle-daemon` or enable it using `systemctl --user enable periwinkle-daemon` to make it run every time you boot up the computer.

I'm only putting it on the internet because maybe there's people that will find this useful.
