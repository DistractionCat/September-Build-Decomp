if (vsp < 20)
    vsp += grav
y += vsp
x += (image_xscale * spd)
if (place_meeting(x, (y + 1), obj_solid) && vsp > 0)
    vsp = -12
