if (other.cutscene == 0 && sprite_index != spr_bigmushroom_bounce && other.state != states.freefall && other.state != states.freefallprep && other.state != states.gotoplayer)
{
    other.jumpstop = 1
    with (other)
    {
        if (state == states.machslide)
            state = states.jump
        if (state == states.normal)
            state = states.jump
    }
    sprite_index = spr_bigmushroom_bounce
    if (other.state == states.jump || other.state == states.normal)
    {
        other.sprite_index = other.spr_machfreefall
        other.image_index = 0
    }
    image_index = 0
    if (sign(other.vsp) == 1)
        other.vsp = (-other.vsp)
    other.vsp -= 6
    if (other.vsp > -14)
        other.vsp = -14
    other.jumpstop = 1
}
