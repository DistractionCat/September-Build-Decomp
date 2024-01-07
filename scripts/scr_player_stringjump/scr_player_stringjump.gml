function scr_player_stringjump() //scr_player_stringjump
{
    hsp = (xscale * movespeed)
    move = (key_left + key_right)
    if (move != 0)
    {
        if (xscale != move)
        {
            if (movespeed > 0)
                movespeed = Approach(movespeed, 0, 0.5)
            else
            {
                xscale = move
                movespeed = 0
            }
        }
        else if (movespeed < 8)
            movespeed = Approach(movespeed, 8, 0.25)
    }
    if place_meeting((x + sign(hsp)), y, obj_solid)
        movespeed = 0
    if (grounded && vsp > 0)
    {
        state = states.normal
        landAnim = 1
        sprite_index = spr_land
        create_particle(x, y, (12 << 0), 0)
    }
}

