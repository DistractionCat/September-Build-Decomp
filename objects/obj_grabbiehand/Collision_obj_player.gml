if (state == (135 << 0))
{
    with (other)
    {
        if (state != states.handstandjump)
        {
            state = states.bump
            sprite_index = spr_player_catched
            other.playerid = id
            other.state = states.grabbing
        }
        else
        {
            scr_pummel()
            other.state = states.stun
            other.stunned = 50
            other.vsp = -6
            other.hsp = (xscale * 5)
            other.image_xscale = (-xscale)
        }
    }
}
