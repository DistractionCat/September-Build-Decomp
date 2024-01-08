if (stationned == 0)
    hsp = (image_xscale * 6)
xscale = image_xscale
if (vsp > 0 && grounded)
{
    with (instance_place(x, (y + 16), obj_slope))
    {
        if (other.y <= (y + 4) && other.image_xscale == sign(image_xscale) && (!(place_meeting((x + sign(image_xscale)), y, obj_solid))))
            other.vsp = -11
    }
}
if ((place_meeting((x + sign(hsp)), y, obj_solid) || scr_solid_slope((x + sign(hsp)), y)) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))) && (!(place_meeting((x + sign(hsp)), y, obj_slope))))
    instance_destroy()
instance_destroy(instance_place((x + hsp), y, obj_destructibles))
if (stationned == 0)
{
    if (!hitboxcreate)
    {
        with (instance_create(x, y, obj_forkhitbox))
            ID = other.id
        hitboxcreate = 1
    }
}
scr_collide()
