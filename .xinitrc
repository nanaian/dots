setxkbmap gb
autocutsel -fork
autocutsel -fork -selection PRIMARY
xsetroot -cursor_name left_ptr

compton &
polybar itsbar &

feh --bg-center ~/img/wallpaper.jpg

bspwm
