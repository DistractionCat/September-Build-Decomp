if (other.state == states.handstandjump)
{
    with (other)
        scr_pummel()
    with (baddieID)
    {
        state = states.normal
        image_xscale *= -1
    }
    instance_destroy()
}
