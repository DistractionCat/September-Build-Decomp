function scr_player_boxxedpepspin() //scr_player_boxxedpepspin
{
    image_speed = 0.35
    hsp = (xscale * movespeed)
    if (scr_solid((x + sign(hsp)), y) && xscale == move && ((!(place_meeting((x + xscale), y, obj_slope))) || scr_solid_slope((x + xscale), y)))
        movespeed = 0
    if (floor(image_index) == (image_number - 1))
    {
        state = states.boxxedpep
        sprite_index = spr_boxxedpepidle
    }
}

