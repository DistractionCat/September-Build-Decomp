if (!instance_exists(baddieID))
{
    instance_destroy()
    return;
}
x = (baddieID.x + (baddieID.image_xscale * 48))
y = (baddieID.y + 48)
image_xscale = baddieID.image_xscale
if (col_buffer > 0)
    col_buffer--
else if (col_buffer == 0)
{
    col_buffer = -1
    collisioned = 0
}
if (baddieID.state != (234 << 0))
    instance_destroy()
