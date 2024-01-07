function scr_player_mort() //scr_player_mort
{
    move = (key_right + key_left)
    hsp = (move * movespeed)
    mort = 0
    doublejump = 0
    jumpstop = 0
    if key_attack
    {
        image_speed = 0.45
        movespeed = 12
        hsp = (xscale * movespeed)
    }
    if key_jump
        input_buffer_jump = 0
    if (dir != xscale)
    {
        dir = xscale
        movespeed = 2
    }
    if (move != 0)
    {
        xscale = move
        if (movespeed < 8)
            movespeed += 0.5
        else if (floor(movespeed) == 8)
            movespeed = 6
    }
    else
        movespeed = 0
    if (!key_attack)
    {
        if (movespeed < 3 && move != 0)
            image_speed = 0.35
        else if (movespeed > 3 && movespeed < 6)
            image_speed = 0.45
        else
            image_speed = 0.6
    }
    if (movespeed > 8)
        movespeed -= 0.1
    if (!landAnim)
    {
        if key_attack
        {
            if (sprite_index != spr_player_mortrun)
                image_index = 0
            sprite_index = spr_player_mortrun
        }
        else if (move != 0)
            sprite_index = spr_move
        else
        {
            sprite_index = spr_idle
            image_speed = 0.35
        }
    }
    else if (floor(image_index) == (image_number - 1))
    {
        landAnim = 0
        if (move != 0)
            sprite_index = spr_move
        else
            sprite_index = spr_idle
    }
    if (!grounded)
    {
        state = states.mortjump
        sprite_index = spr_fall
    }
    else if (input_buffer_jump < 8)
    {
        input_buffer_jump = 0
        state = states.mortjump
        doublejump = 0
        vsp = -11
        sprite_index = spr_jump
        image_index = 0
        scr_soundeffect(sfx_jump)
        create_particle(x, y, (5 << 0), 0)
    }
    mort_attack()
}

function mort_attack() //mort_attack
{
    if key_slap2
    {
        state = states.mortattack
        sprite_index = spr_player_mortattackfront
        image_index = 0
        var _angle = 0
        if key_up
        {
            if (!grounded)
                vsp = -5
            _angle = 90
            sprite_index = spr_player_mortattackup
        }
        else if (key_down && (!grounded))
        {
            if (!grounded)
                vsp = 3
            _angle = 270
            sprite_index = spr_player_mortattackdown
        }
        with (instance_create(x, y, obj_morthitbox))
        {
            playerid = other.id
            if (_angle == 0)
                image_xscale = other.xscale
            image_angle = _angle
            alarm[0] = 15
        }
    }
}

function Mort_DownMovement() //Mort_DownMovement
{
    if (image_angle == 270)
    {
        with (playerid)
        {
            doublejump = 0
            vsp = -8
        }
    }
}

