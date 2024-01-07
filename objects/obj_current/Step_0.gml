if place_meeting(x, (y - 1), obj_player)
{
    with (obj_player)
    {
        if (state != states.golf && state != states.tackle && state != states.gotoplayer)
        {
            if place_meeting(x, (y + 1), other)
            {
                if (state != states.barrel && state != states.barreljump && state != states.barrelslide && state != states.barrelclimbwall)
                {
                    state = states.slipnslide
                    sprite_index = spr_currentplayer
                }
                else
                {
                    state = states.barrelslide
                    if (sprite_index != spr_player_barrelslipnslide)
                        sprite_index = spr_player_barrelroll
                }
                xscale = sign(other.image_xscale)
                movespeed = 20
            }
        }
    }
}
