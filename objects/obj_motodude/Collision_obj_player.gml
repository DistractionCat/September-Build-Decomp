if (stationned == 1)
{
    other.xscale = sign(image_xscale)
    other.state = states.motorcycle
    other.movespeed = abs(hsp)
    explode = 0
    instance_destroy()
}
