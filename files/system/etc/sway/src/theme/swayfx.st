# SwayFX config options
# Remove .st from this file if you dont use SwayFX

set {
    $swayfx_window_opacity 0.9
    $swayfx_corner_radius 10
    $swayfx_blur enable
    $swayfx_blur_xray off
    $swayfx_blur_passes 2
    $swayfx_blur_radius 10

    $swayfx_shadows enable
    $swayfx_shadows_on_csd off
    $swayfx_shadows_blur_radius 8
    $swayfx_shadows_color #0000007F
}

include $HOME/.custom_theme_swayfx


### Appearance
corner_radius $swayfx_corner_radius

# Window background blur
blur        $swayfx_blur
blur_xray   $swayfx_blur_xray
blur_passes $swayfx_blur_passes
blur_radius $swayfx_blur_radius

# Shadows
shadows             $swayfx_shadows
shadows_on_csd      $swayfx_shadows_on_csd
shadow_blur_radius  $swayfx_shadows_blur_radius
shadow_color        $swayfx_shadows_color


# Window opacity and fading overrides
for_window [class=".*"] opacity $swayfx_window_opacity
# Dynamic fade configuration for unfocused surfaces
#default_dim_inactive 0.2


layer_effects "swaybar" {
    blur            $swayfx_blur
    blur_xray       $swayfx_blur_xray
    blur_passes     $swayfx_blur_passes
    blur_radius     $swayfx_blur_radius
    shadows         $swayfx_shadows
    corner_radius  $swayfx_corner_radius
}
