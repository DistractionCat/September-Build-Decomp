function scr_player_barrelslide() //scr_player_barrelslide
{
    image_speed = 0.5
    hsp = (xscale * movespeed)
    dir = xscale
    if key_jump
        input_buffer_jump = 0
    if (vsp < 0 && (!jumpstop) && (!key_jump2))
    {
        vsp /= 20
        jumpstop = 1
    }
    if (floor(image_index) == (image_number - 1))
    {
        if (sprite_index == spr_player_barrelslipnslide)
            sprite_index = spr_player_barrelroll
    }
    if (scr_slope() && hsp != 0)
    {
        with (instance_place(x, (y + 1), obj_slope))
        {
            if (sign(image_xscale) == (-sign(other.xscale)))
                other.movespeed += other.barrelroll_slopeaccel
            else if (other.movespeed < (other.barrel_maxmovespeed - 4) && other.movespeed > 5)
                other.movespeed -= other.barrelroll_slopedeccel
            other.movespeed = clamp(other.movespeed, 0, (other.barrel_maxmovespeed + 4))
        }
    }
    if ((!key_down) && (!(place_meeting(x, (y + 1), obj_current))))
    {
        if grounded
            state = states.barrel
        else
        {
            state = states.barreljump
            sprite_index = spr_player_barrelfall
        }
    }
    if (grounded && input_buffer_jump < 8)
    {
        input_buffer_jump = 8
        vsp = -11
        jumpstop = 0
    }
    if place_meeting((x + sign(hsp)), y, obj_solid)
    {
        if scr_slope()
        {
            vsp = (-((14 * (movespeed / barrel_maxmovespeed))))
            if (vsp > -4)
                vsp = -4
            trace(vsp)
            state = states.barrelclimbwall
            roll = 0
        }
        else
        {
            xscale *= -1
            instance_create((x + (xscale * 10)), (y + 10), obj_bumpeffect)
        }
    }
    if (movespeed >= barrel_rollspeed_threshold)
    {
        with (instance_place((x + hsp), y, obj_destructibles))
            instance_destroy()
        with (instance_place((x + hsp), y, obj_baddie))
        {
            if destroyable
                instance_destroy()
        }
    }
}

