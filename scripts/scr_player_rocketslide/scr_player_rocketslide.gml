function scr_player_rocketslide() //scr_player_rocketslide
{
    hsp = Approach(hsp, 0, 0.5)
    vsp = 0
    if (floor(image_index) == (image_number - 1))
    {
        state = states.rocket
        sprite_index = spr_rocket
        image_index = 0
        xscale *= -1
    }
}

