function scr_player_mortattack() //scr_player_mortattack
{
    image_speed = 0.45
    hsp = (xscale * movespeed)
    if (floor(image_index) == (image_number - 1))
    {
        if (grounded && vsp > 0)
        {
            state = states.mort
            sprite_index = spr_idle
            landAnim = 0
        }
        else
        {
            state = states.mortjump
            sprite_index = spr_fall
        }
    }
}

