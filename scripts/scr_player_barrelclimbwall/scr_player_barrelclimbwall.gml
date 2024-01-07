function scr_player_barrelclimbwall() //scr_player_barrelclimbwall
{
    move = (key_left + key_right)
    hsp = 0
    if (sprite_index == spr_player_barrelslipnslide && floor(image_index) == (image_number - 1))
        sprite_index = spr_player_barrelroll
    if ((!roll) && (!(place_meeting((x + xscale), y, obj_solid))))
        roll = 1
    if roll
    {
        hsp = (move * 3)
        if (move != 0)
            xscale = move
    }
    if (grounded && vsp > 0)
    {
        state = states.barrelslide
        if (!roll)
            xscale *= -1
        hsp = (xscale * movespeed)
    }
}

