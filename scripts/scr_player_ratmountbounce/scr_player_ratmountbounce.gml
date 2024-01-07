function scr_player_ratmountbounce() //scr_player_ratmountbounce
{
    image_speed = 0.35
    if (movespeed > 16)
        movespeed = 16
    if (sprite_index == spr_player_ratmountbounce)
    {
        move = (key_left + key_right)
        hsp = 0
        vsp = 0
        if (floor(image_index) == (image_number - 1))
        {
            hsp = (xscale * movespeed)
            movespeed += 4
            vsp = tauntstoredvsp
            sprite_index = spr_player_ratmountwalljump
            if (move != 0 && move != xscale)
                xscale = move
            vsp = clamp(vsp, -16, -8)
        }
        if (!key_attack)
            state = states.ratmount
    }
    else
    {
        hsp = (xscale * movespeed)
        ratmount_fallingspeed += 0.2
        if key_jump
            input_buffer_jump = 0
        if (scr_solid((x + sign(hsp)), y) && ((!(place_meeting((x + sign(hsp)), y, obj_slope))) || scr_solid_slope((x + sign(hsp)), y)))
        {
            state = states.ratmountclimbwall
            if (movespeed > 16)
                movespeed = 16
            sticktime = 15
            landAnim = 0
        }
        if (grounded && vsp > 0)
        {
            tauntstoredvsp = (-((8 + ratmount_fallingspeed)))
            ratmount_fallingspeed = 0
            sprite_index = spr_player_ratmountbounce
            image_index = 0
        }
    }
    ratmount_dotaunt()
}

