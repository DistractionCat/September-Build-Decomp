function scr_player_cheesepep() //scr_player_cheesepep
{
    key_particles = 0
    mach2 = 0
    momemtum = 0
    alarm[5] = 2
    alarm[7] = 60
    move = (key_left + key_right)
    if (!(place_meeting(x, (y + 1), obj_railparent)))
        hsp = (xscale * movespeed)
    else
    {
        var _railinst = instance_place(x, (y + 1), obj_railparent)
        hsp = ((xscale * movespeed) + (_railinst.movespeed * _railinst.dir))
    }
    if key_jump
        input_buffer_jump = 0
    if (dir != xscale)
    {
        dir = xscale
        movespeed = 0
    }
    if (grounded && move != 0 && sprite_index == spr_cheesepepidle)
        sprite_index = spr_cheesepepwalk
    else if (grounded && move == 0 && sprite_index == spr_cheesepepwalk)
        sprite_index = spr_cheesepepidle
    if (move != 0)
    {
        xscale = move
        if (movespeed < 8)
            movespeed += 0.5
        else if (floor(movespeed) == 8)
            movespeed = 8
        if (movespeed < 1)
            image_speed = 0.15
        else if (movespeed > 1 && movespeed < 6)
            image_speed = 0.35
        else
            image_speed = 0.6
    }
    else
    {
        movespeed = 0
        image_speed = 0.35
    }
    if (movespeed > 8)
        movespeed -= 0.1
    if (!grounded)
    {
        state = states.cheesepepjump
        sprite_index = spr_cheesepepfall
        jumpstop = 1
    }
    if (input_buffer_jump < 8 && grounded)
    {
        input_buffer_jump = 8
        vsp = -11
        jumpstop = 0
        state = states.cheesepepjump
        sprite_index = spr_cheesepepjumpstart
        image_index = 0
    }
    if (scr_slope() && ((!(place_meeting((x + sign(hsp)), y, obj_slope))) || place_meeting((x + sign(hsp)), (y - 4), obj_solid)) && place_meeting((x + sign(hsp)), y, obj_solid))
    {
        state = states.cheesepepstick
        wallspeed = (movespeed - 2)
        if (wallspeed < 2)
            wallspeed = 6
        movespeed = 0
        sticktime = 10
    }
    if key_attack
    {
        state = states.cheesepepfling
        fling = 0
    }
    if (floor(image_index) == (image_number - 1))
    {
        if (sprite_index == spr_cheesepepland || sprite_index == spr_cheesepepintro)
        {
            if (move != 0)
                sprite_index = spr_cheesepepwalk
            else
                sprite_index = spr_cheesepepidle
        }
    }
}

