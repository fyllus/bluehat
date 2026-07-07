# SET DEFAULT COLORS BEFORE TO AVOID ERRORS OF NON-FILE OR INVALID VAR
set {
    $destructive_color                  #e78284
    $destructive_bg_color               #e78284
    $destructive_fg_color               #c6d0f5
    $theme_selected_bg_color            #ca9ee6
    $theme_selected_fg_color            #303446
    $theme_unfocused_bg_color           #303446
    $theme_unfocused_fg_color           #c6d0f5
    $theme_unfocused_base_color         #292c3c
    $accent_color                       #85c1dc
    $accent_bg_color                    #85c1dc
    $accent_fg_color                    #303446
}

# EXECUTE THEME UPDATE FROM GTK AND CREATE CUSTOM COLOR FROM IT

exec touch $HOME/.config/sway/sway-colors-include.st
exec touch $HOME/.config/rofi/rofi-colors-include.rasi
exec touch $HOME/.config/waybar/waybar-colors-include.css
exec touch $HOME/.config/foot/foot-colors-include.ini

exec_always bash -ic "swayrun sway-theme --update --sway"
exec_always bash -ic "swayrun sway-theme --update --rasi"
exec_always bash -ic "swayrun sway-theme --update --waybar"
exec_always bash -ic "swayrun sway-theme --update --foot"

include $HOME/.config/sway/sway-colors-include.st


set {
    $focused_inative_border             $destructive_color
    $focused_inative_background         $destructive_bg_color
    $focused_inative_text               $destructive_fg_color
    $focused_inative_indicator          $destructive_color
    $focused_inative_child_border       $destructive_color

    $focused_border                     $theme_selected_bg_color
    $focused_background                 $theme_selected_bg_color
    $focused_text                       $theme_selected_fg_color
    $focused_indicator                  $theme_selected_bg_color
    $focused_child_border               $theme_selected_bg_color

    $unfocused_border                   $theme_unfocused_bg_color
    $unfocused_background               $theme_unfocused_bg_color
    $unfocused_text                     $theme_unfocused_fg_color
    $unfocused_indicator                $theme_unfocused_base_color
    $unfocused_child_border             $theme_unfocused_base_color

    $urgent_border                      $accent_color
    $urgent_background                  $accent_bg_color
    $urgent_text                        $accent_fg_color
    $urgent_indicator                   $accent_color
    $urgent_child_border                $accent_color
}

set  {
	$bar_background						$focused_text
	$bar_statusline						$focused_background
	$bar_separator						$focused_border

	$bar_wsf_border 					$focused_border
	$bar_wsf_background					$focused_background
	$bar_wsf_text	 					$focused_text

	$bar_wsi_border 					$unfocused_border
	$bar_wsi_background					$unfocused_background
	$bar_wsi_text	 					$focused_border

	$bar_wsa_border 					$focused_border
	$bar_wsa_background					$focused_background
	$bar_wsa_text	 					$focused_border

	$bar_wsu_border 					$urgent_border
	$bar_wsu_background					$urgent_background
	$bar_wsu_text	 					$urgent_text
	
					
	}	

set {
	$wmenu_bg $bar_wsi_background
	$wmenu_fg $bar_wsi_text
	$wmenu_BG $bar_wsf_background
	$mwenu_FG $bar_wsf_text
}



# INCLUDE CUSTOM COLOR FOR LAST IF EXIST, THAN THIS CAN OVERRIDE THIS ENTIRE CONFIG IF WANTED
include $HOME/.custom_theme_color
