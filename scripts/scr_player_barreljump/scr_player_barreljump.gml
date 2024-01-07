function scr_player_barreljump() //scr_player_barreljump
{
    image_speed = 0.35
    move = (key_left + key_right)
    hsp = (xscale * movespeed)
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_barreljump)
        sprite_index = spr_player_barrelfall
    if key_jump
        input_buffer_jump = 0
    if (dir != xscale)
    {
        movespeed = 0
        dir = xscale
    }
    if ((!jumpstop) && (!key_jump2) && vsp < 0)
    {
        jumpstop = 1
        vsp /= 20
    }
    if (move != 0)
    {
        if (xscale == move)
        {
            if (movespeed < barrel_maxfootspeed)
                movespeed += barrel_accel
        }
        else if (movespeed > 0)
            movespeed -= barrel_deccel
        else
        {
            movespeed = 0
            xscale = move
        }
    }
    else
        movespeed = Approach(movespeed, 0, barrel_deccel)
    if grounded
    {
        state = states.barrel
        sprite_index = spr_player_barrelland
        image_index = 0
        create_particle(x, y, (12 << 0), 0)
    }
    if (place_meeting((x + sign(hsp)), y, obj_solid) && (!(place_meeting((x + sign(hsp)), y, obj_slope))))
        movespeed = 0
}

