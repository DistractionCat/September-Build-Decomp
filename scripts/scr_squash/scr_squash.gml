function scr_squash() //scr_squash
{
    xscale = Approach(xscale, 1, 0.03)
    yscale = Approach(yscale, 1, 0.03)
    if (state == states.stun && thrown == 1)
        angle += ((-image_xscale) * 30)
    else if (angle != 0)
        angle = Approach(angle, 0, (image_xscale * 50))
}

