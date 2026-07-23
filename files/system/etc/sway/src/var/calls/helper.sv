include $SWAYDIR/src/theme/color.st
include $SWAYDIR/src/theme/define.st


set {
	$__SWAY_FUZZY bluemenu

	$__MENU_ARGS -i -f "$font_family $font_size" -N "$wmenu_bg" -n "$wmenu_fg" -S "$wmenu_BG" -s "$wmenu_FG"

	$__WMENU $__SWAY_FUZZY apps $__MENU_ARGS

	$__POFF $__SWAY_FUZZY power $__MENU_ARGS

	$__SCRATCH $__SWAY_FUZZY scratchpad $__MENU_ARGS

	$__SCREENSHOT $__SWAY_FUZZY image $__MENU_ARGS

	$__BGSELEC bluewall $WALLPAPERS \
		"bg+:$wmenu_BG" \
	    "fg+:$wmenu_bg" \
	    "bg:-1" \
	    "fg:$wmenu_fg" \
	    "hl:$focused_border" \
	    "prompt:$focused_border" \
	    "pointer:$focused_border" \
	    "marker:$focused_border" \
	    "border:$unfocused_border" \
	    "header:$focused_border"
    $BASH   exec bash -ic

    # DEFAULT POWER MENU CONFIG
    $__PMSG --edge bottom --background "282a36"\
                   --text "ffffff" --button-background "000000"\
                   --button-text "ffffff" --border "282a36"\
                   --border-bottom "00000000"

    $__POFFOLD swaynag $__PMSG -m 'Power Menu:' \
    -B 'Shutdown' 'systemctl poweroff'\
    -B 'Suspend' 'systemctl suspend'\
    -B 'Hibernate' 'systemctl hibernate'\
    -B 'Reboot UEFI' 'systemctl reboot --firmware-setup'\
    -B 'Reboot' 'systemctl reboot'\
    -B 'Logout' 'swaymsg exit'


    $__LIGHT_NOTIFY VALUE=$(brightnessctl --percentage get) && \
        notify-send -e -h string:x-canonical-private-synchronous:brightness \
        -h "int:value:$VALUE" -i display-brightness-symbolic -t 800 "Brightness: ${VALUE}%"

    $__AUDIO_NOTIFY VALUE=$(pamixer --get-volume) && \
        notify-send -e -h string:x-canonical-private-synchronous:volume \
        -h "int:value:$VALUE" -i audio-volume-high-symbolic -t 800 "Volume: ${VALUE}%"
}
