if ((x + hsp) == xprevious)
    stop_buffer--
else
    stop_buffer = 8
hsp = (image_xscale * movespeed)
if (((!scr_slope()) && instance_place((x + sign(hsp)), y, obj_solid)) || stop_buffer <= 0)
{
    repeat (8)
        instance_create(x, y, obj_slimedebris)
    instance_destroy()
}
scr_collision()
