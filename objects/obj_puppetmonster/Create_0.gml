hsp = 0
vsp = 0
hsp_carry = 0
vsp_carry = 0
platformid = noone
grav = 0.5
grounded = 0
event_inherited()
monsterid = 2
spr_dead = spr_monstercheese_dead
state = (215 << 0)
xs = (room_width / 2)
ys = -100
substate = (135 << 0)
backgroundID = -4
var a = layer_get_all()
var lowestdepth = 10000
for (var i = 0; i < array_length(a); i++)
{
    var b = a[i]
    if (layer_get_element_type(b) == 1)
    {
        trace("layer background")
        if (layer_get_depth(b) < lowestdepth)
        {
            backgroundID = layer_background_get_id(b)
            lowestdepth = layer_get_depth(b)
            trace(lowestdepth)
        }
    }
}
trace(backgroundID)
trace(a)
