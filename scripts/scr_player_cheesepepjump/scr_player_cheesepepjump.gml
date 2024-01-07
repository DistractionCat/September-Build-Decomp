function scr_player_cheesepepjump() //scr_player_cheesepepjump
{
    image_speed = 0.35
    if (floor(image_index) == (image_number - 1))
    {
        if (sprite_index == spr_cheesepepjumpstart)
            sprite_index = spr_cheesepepjump
        else if (sprite_index == spr_cheesepepjump && vsp > 0)
            sprite_index = spr_cheesepepfall
    }
    hsp = (xscale * movespeed)
    move = (key_left + key_right)
    if ((!key_jump2) && (!jumpstop) && vsp < 0)
    {
        jumpstop = 1
        vsp /= 10
    }
    if key_jump
        input_buffer_jump = 0
    if (dir != xscale)
    {
        dir = xscale
        movespeed = 0
    }
    if (!momemtum)
    {
        if (move != 0)
        {
            xscale = move
            if (movespeed < 8)
                movespeed += 0.5
            else if (floor(movespeed) == 8)
                movespeed = 8
        }
        else
            movespeed = 0
    }
    else if (move != 0)
    {
        if (xscale == move)
            movespeed = Approach(movespeed, 8, 0.5)
        else
        {
            movespeed = Approach(movespeed, 0, 0.5)
            if (movespeed <= 0)
            {
                movespeed = 0
                xscale = move
            }
        }
    }
    else
        movespeed = Approach(movespeed, 0, 0.5)
    if (place_meeting((x + sign(xscale)), y, obj_solid) && (!(place_meeting(x, (y + 1), obj_slope))))
    {
        state = states.cheesepepstick
        wallspeed = movespeed
        if (vsp < 0)
        {
            wallspeed = (movespeed - 2)
            if (wallspeed < 2)
                wallspeed = 6
        }
        else
            wallspeed = 0
        movespeed = 0
        sticktime = 10
    }
    if grounded
    {
        state = states.cheesepep
        sprite_index = spr_cheesepepland
        image_index = 0
    }
}

