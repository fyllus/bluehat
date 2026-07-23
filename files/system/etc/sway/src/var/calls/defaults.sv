include $SWAYDIR/src/var/calls/helper.sv


set {

    $DEFAULT_TERM   	exec footclient --app-id=Terminal --title=Terminal
	$DEFAULT_MENU  	    exec $__WMENU
    $DEFAULT_FILES  	exec footclient --app-id=Yazi --title=Yazi -e yazi
    $DEFAULT_RELOAD 	exec swaymsg reload
    $DEFAULT_WALLPAPER 	exec footclient --app-id=Wallpaper --title=Sway-Wallpaper -e $__BGSELEC
}

set {
	$DEFAULT_VOLUME_RAISE exec pamixer -ui 2 && $__AUDIO_NOTIFY
	$DEFAULT_VOLUME_LOWER exec pamixer -ud 2 && $__AUDIO_NOTIFY
	$DEFAULT_VOLUME_MUTE exec pamixer -t $ && $__AUDIO_NOTIFY
}

set {
	$DEFAULT_LIGHT_RAISE  exec brightnessctl -n set 2%+ && $__LIGHT_NOTIFY
    $DEFAULT_LIGHT_LOWER  exec brightnessctl -n set 2%- && $__LIGHT_NOTIFY
    }

set {
    $DEFAULT_POWER_OFF    exec $__POFF
    $DEFAULT_LOCKSCREEN   exec gtklock -d
    $DEFAULT_PRINT_NORM   exec $__SCREENSHOT
    $DEFAULT_SCRATCH_GET  exec $__SCRATCH
   }
