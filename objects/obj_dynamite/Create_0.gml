hsp = 0
vsp = 0
grav = 0.5
grounded = 0
playerid = ((!(place_meeting(x, y, obj_player))) ? instance_nearest(x, y, obj_player) : instance_place(x, y, obj_player))
movespeed = 6
image_speed = 0.35
countdown = 120
depth = -10
playercollision = 1
obj_explosion = obj_dynamiteexplosion
kick = 0
mask_index = spr_player_mask
platformid = noone
hsp_carry = 0
scr_collision_init()
