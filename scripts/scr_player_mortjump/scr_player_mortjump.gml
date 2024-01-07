function scr_player_mortjump() //scr_player_mortjump
{
    image_speed = 0.35
    move = (key_left + key_right)
    hsp = (move * movespeed)
    if key_jump
        input_buffer_jump = 0
    if (dir != xscale)
    {
        movespeed = 0
        dir = xscale
    }
    if ((!key_jump2) && (!jumpstop) && vsp < 0.5)
    {
        jumpstop = 1
        vsp /= 20
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
    if (movespeed > 8)
        movespeed -= 0.1
    if (floor(image_index) == (image_number - 1))
    {
        if (sprite_index == spr_jump)
            sprite_index = spr_fall
        else if (sprite_index == spr_player_mortdoublejump || sprite_index == spr_mortdoublejumpstart)
            sprite_index = spr_mortdoublejump
    }
    if (grounded && vsp > 0.5)
    {
        if (input_buffer_jump < 8)
        {
            input_buffer_jump = 8
            state = states.mortjump
            vsp = -11
            sprite_index = spr_jump
            image_index = 0
            doublejump = 0
            jumpstop = 0
            scr_soundeffect(sfx_jump)
            create_particle(x, y, (5 << 0), 0)
        }
        else
        {
            state = states.mort
            landAnim = 1
            sprite_index = spr_land
            image_index = 0
        }
    }
    else if ((!doublejump) && key_jump)
    {
        scr_soundeffect(sfx_jump)
        jumpstop = 0
        input_buffer_jump = 8
        doublejump = 1
        state = states.mortjump
        sprite_index = spr_player_mortdoublejump
        image_index = 0
        vsp = -11
        repeat (4)
            create_debris(x, y, spr_feather)
    }
    mort_attack()
}

