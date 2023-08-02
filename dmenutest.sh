#!/bin/sh

MPD_HOST="localhost"
MPD_PORT="6600"

# Function to send commands to MPD
function mpdcom {
    echo "$1" | nc -w 1 "$MPD_HOST" "$MPD_PORT"
}

currentsong=$(mpdcom currentsong | tr -d '\r')

title=$(echo $currentsong | grep -oP '(?<=Title:\s).*?(?=\s(?:Title:|Album:|Track:|Date:|Genre:|Disc:|Time:|duration:|Pos:|Id:|$))')
artist="$(echo "$currentsong" | awk -F ': ' '/^Artist:/ {print $2}' | awk '{$1=$1};1')"
album=$(echo $currentsong | grep -oP '(?<=Album:\s).*?(?=\s(?:Title:|Album:|Track:|Date:|Genre:|Disc:|Time:|duration:|Pos:|Id:|$))')
year=$(echo $currentsong | grep -oP '(?<=Date:\s).*?(?=\s(?:Title:|Album:|Track:|Date:|Genre:|Disc:|Time:|duration:|Pos:|Id:|$))')

# Debugging purposes
echo "Title: $title"
#echo "$currentsong"

echo "Artist: $artist"
echo "Album: $album"
echo "Year: $year"

dmenu="dmenu -i -p "mpd:" -fn $DMENU_FONT -nb $DWMCOL_GRAY1 -nf $DWMCOL_GRAY3 -sb $DWMCOL_CYAN -sf $DWMCOL_GRAY4"

# MPD Controls
mpd=("" "" "" "" "" "$artist - $title" "Open NCMPCPP")
#dmenu_run -m dmenumon -fn $DMENU_FONT -nb $DWMCOL_GRAY1 -nf $DWMCOL_GRAY3 -sb $DWMCOL_CYAN -sf $DWMCOL_GRAY4

# Show dmenu with the controls
prompt=$(printf '%s\n' "${mpd[@]}" | $dmenu)

# Execute the desired action
case $prompt in
    "")
	$(mpdcom prev) > /dev/null 2>&1
	songinfo
        ;;
    "")
	$(mpdcom pause) > /dev/null 2>&1
	songinfo
        ;;
    "")
	$(mpdcom play) > /dev/null 2>&1
	songinfo
	;;
    "")
	$(mpdcom stop) > /dev/null 2>&1
	songinfo
        ;;
    "")
	$(mpdcom next) > /dev/null 2>&1
	songinfo
        ;;
    "$artist - $title")
    	songinfo
	;;
    "Open NCMPCPP")
    	st -e ncmpcpp
	;;
    *)
        cat /dev/null
        ;;
esac
