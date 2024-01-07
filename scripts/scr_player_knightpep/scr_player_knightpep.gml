function scr_player_knightpep() //scr_player_knightpep
{
    alarm[5] = 2
    alarm[7] = 60
    if (sprite_index == spr_knightpep_attack && movespeed > 0)
        movespeed -= 0.05
    if (knightmiddairstop != 0)
    {
        hsp = 0
        vsp = 0
        knightmiddairstop--
    }
    else if (knightmove == 0)
    {
        doublejump = 1
        input_buffer_jump = 0
        vsp = -11
        if (move != 0)
            sprite_index = spr_knightpep_doublejump
        image_index = 0
        move = (key_left + key_right)
        if (move != 0)
            xscale = move
        if (move != 0)
            movespeed = 6
        if (move == 0)
            movespeed = 0
        knightmove = -1
    }
    else if (knightmove == 1)
    {
        with (instance_create(x, y, obj_parryeffect))
            sprite_index = spr_knightpep_downcloud
        sprite_index = spr_knightpep_downtrust
        vsp = 10
        hsp = 0
        movespeed = 0
        knightmove = -1
    }
    if (sprite_index == spr_knightpep_attack && floor(image_index) == (image_number - 1))
        sprite_index = spr_knightpep_idle
    if ((sprite_index == spr_knightpepland || sprite_index == spr_knightpepwalk || sprite_index == spr_knightpepidle) && knightmiddairstop == 0)
    {
        move = (key_left + key_right)
        hsp = (move * movespeed)
    }
    else if ((sprite_index == spr_knightpep_attack || sprite_index == spr_knightpepjump || sprite_index == spr_knightpepfall || sprite_index == spr_knightpep_doublejump || sprite_index == spr_knightpep_downtrust) && knightmiddairstop == 0)
        hsp = (xscale * movespeed)
    else if grounded
        hsp = 0
    if ((!grounded) && key_down2 && sprite_index != spr_knightpep_downtrust)
    {
        knightmiddairstop = 10
        knightmove = 1
    }
    if key_jump
        input_buffer_jump = 0
    if (grounded && vsp > 0)
        jumpstop = 0
    if (dir != xscale && grounded)
    {
        dir = xscale
        movespeed = 0
    }
    if (grounded && move != 0 && sprite_index == spr_knightpepidle)
        sprite_index = spr_knightpepwalk
    else if (grounded && move == 0 && sprite_index == spr_knightpepwalk)
        sprite_index = spr_knightpepidle
    if ((!key_jump2) && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
    {
        vsp /= 2
        jumpstop = 1
    }
    if (grounded && vsp > 0)
        jumpstop = 0
    if (input_buffer_jump < 8 && vsp > 0 && grounded && (sprite_index == spr_knightpepidle || sprite_index == spr_knightpep_downtrust || sprite_index == spr_knightpepland || sprite_index == spr_knightpepwalk))
    {
        image_index = 0
        sprite_index = spr_knightpepjumpstart
    }
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_knightpepjumpstart)
    {
        scr_soundeffect(sfx_jump)
        vsp = -11
        if (move == 0)
            movespeed = 0
        if (move != 0)
            movespeed = 6
        sprite_index = spr_knightpepjump
    }
    if ((floor(image_index) == (image_number - 1) && sprite_index == spr_knightpepjump) || ((!grounded) && sprite_index != spr_knightpepjump && sprite_index != spr_knightpepthunder && sprite_index != spr_knightpep_downtrust && sprite_index != spr_knightpep_doublejump))
        sprite_index = spr_knightpepfall
    if ((sprite_index == spr_knightpep_downtrust || sprite_index == spr_knightpepfall || sprite_index == spr_knightpep_doublejump) && grounded && vsp > 0 && (!scr_slope()))
    {
        with (obj_baddie)
        {
            if point_in_camera(x, y, view_camera[0])
            {
                vsp = -7
                hsp = 0
            }
        }
        with (obj_camera)
        {
            shake_mag = 10
            shake_mag_acc = (30 / room_speed)
        }
        combo = 0
        bounce = 0
        image_index = 0
        freefallstart = 0
        momemtum = 0
        scr_soundeffect(sfx_groundpound)
        create_particle(x, y, (12 << 0), 0)
        sprite_index = spr_knightpepland
        GamepadSetVibration((object_index == obj_player1 ? 0 : 1), 1, 1, 0.9)
    }
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_knightpepland)
    {
        sprite_index = spr_knightpepidle
        knightmomentum = 0
    }
    if (move != 0 && grounded)
        xscale = move
    if grounded
    {
        doublejump = 0
        if (move != 0)
        {
            if (movespeed < 6)
                movespeed += 0.5
            else if (movespeed == 6)
                movespeed = 6
        }
        else if (sprite_index != spr_knightpepjumpstart)
            movespeed = 0
    }
    else if (knightmiddairstop == 0)
    {
        hsp = (xscale * movespeed)
        if ((!doublejump) && key_jump)
        {
            knightmiddairstop = 10
            knightmove = 0
        }
    }
    if ((!grounded) && place_meeting((x + sign(hsp)), y, obj_solid) && (!scr_slope()))
        movespeed = 0
    if (move != 0 && hsp != 0)
    {
        if (movespeed < 1)
            image_speed = 0.15
        else if (movespeed > 1 && movespeed < 4)
            image_speed = 0.35
        else
            image_speed = 0.6
    }
    else
        image_speed = 0.35
    if (floor(image_index) == 4 && sprite_index == spr_knightpepstart)
        instance_create(x, (y - 600), obj_thunder)
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_knightpepthunder)
        sprite_index = spr_knightpepidle
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_knightpep_doublejump)
        image_index = (image_number - 1)
    if ((!instance_exists(obj_cloudeffect)) && grounded && move != 0 && (floor(image_index) == 4 || floor(image_index) == 10))
        instance_create(x, (y + 43), obj_cloudeffect)
    if (move != 0 && (floor(image_index) == 3 || floor(image_index) == 8) && steppy == 0)
        steppy = 1
    if (move != 0 && floor(image_index) != 3 && floor(image_index) != 8)
        steppy = 0
    if (sprite_index == spr_knightpepfall || sprite_index == spr_knightpep_downtrust)
    {
        knightmomentum += 0.35
        trace(knightmomentum)
    }
    if (scr_slope() && sprite_index != spr_knightpepthunder)
    {
        if (sprite_index == spr_knightpep_downtrust)
        {
            movespeed = knightmomentum
            if (movespeed < 2)
                movespeed = 2
            if (movespeed > 20)
                movespeed = 20
        }
        else
            movespeed = 2
        knightmomentum = 0
        trace(movespeed)
        with (instance_place(x, (y + 1), obj_slope))
            other.xscale = (-sign(image_xscale))
        state = states.knightpepslopes
        sprite_index = spr_knightpepdownslope
        slope_buffer = 20
    }
}

