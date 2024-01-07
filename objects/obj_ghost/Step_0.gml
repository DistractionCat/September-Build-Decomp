targetplayer = (global.coop ? instance_nearest(x, y, obj_player) : obj_player1)
var _d = point_direction(x, y, targetplayer.x, targetplayer.y)
hsp = lengthdir_x(movespeed, _d)
vsp = lengthdir_y(movespeed, _d)
image_xscale = (targetplayer.x != x ? sign((targetplayer.x - x)) : image_xscale)
x += hsp
y += vsp
