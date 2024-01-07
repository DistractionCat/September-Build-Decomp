function scr_player_barrel() //scr_player_barrel
{
    image_speed = (movespeed / 4)
    if (image_speed < 0.35)
        image_speed = 0.35
    if (image_speed > 0.85)
        image_speed = 0.85
    move = (key_right + key_left)
    hsp = (xscale * movespeed)
    if key_jump
        input_buffer_jump = 0
    if (dir != xscale)
    {
        movespeed = 0
        dir = xscale
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
    if (sprite_index == spr_player_barrelland && floor(image_index) == (image_number - 1))
        sprite_index = spr_player_barrelidle
    if grounded
    {
        if (sprite_index != spr_player_barrelland)
        {
            if (hsp != 0)
                sprite_index = spr_player_barrelmove
            else
                sprite_index = spr_player_barrelidle
        }
        if (scr_slope() && hsp != 0)
        {
            with (instance_place(x, (y + 1), obj_slope))
            {
                if (sign(image_xscale) == (-sign(other.xscale)))
                    other.movespeed += other.barrel_slopeaccel
                else if (other.movespeed < (other.barrel_maxmovespeed - 4) && other.movespeed > 5)
                    other.movespeed -= other.barrel_slopedeccel
                other.movespeed = clamp(other.movespeed, 0, other.barrel_maxmovespeed)
            }
        }
        if (input_buffer_jump < 8 && (!key_down))
        {
            scr_soundeffect(sfx_jump)
            input_buffer_jump = 8
            vsp = -11
            if (move != xscale && move != 0)
            {
                xscale = move
                if (movespeed >= (barrel_maxfootspeed - 6))
                    movespeed = barrel_maxfootspeed
            }
            state = states.barreljump
            sprite_index = spr_player_barreljump
            image_index = 0
            jumpstop = 0
            create_particle(x, y, (3 << 0), 0)
        }
        if key_down
        {
            if (movespeed < 4)
                movespeed = 4
            state = states.barrelslide
            sprite_index = spr_player_barrelslipnslide
            image_index = 0
        }
    }
    else
    {
        state = states.barreljump
        sprite_index = spr_player_barrelfall
        image_index = 0
        if (vsp < 0)
            sprite_index = spr_player_barreljump
    }
    if (place_meeting((x + sign(hsp)), y, obj_solid) && (!(place_meeting((x + sign(hsp)), y, obj_slope))))
    {
        movespeed = 0
        if (sprite_index == spr_player_barrelmove)
            sprite_index = spr_player_barrelidle
    }
    if (sprite_index == spr_player_barrelmove)
    {
        if ((!steppy) && (floor(image_index == 4) || floor(image_index) == 13))
        {
            create_particle(x, (y + 43), (1 << 0), 0)
            steppy = 1
        }
        if (floor(image_index) != 4 && floor(image_index) != 13)
            steppy = 0
    }
}

