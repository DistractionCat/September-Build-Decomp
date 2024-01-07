function scr_player_balloon() //scr_player_balloon
{
    sprite_index = spr_mortdoublejump
    hsp = (move * movespeed)
    move = (key_left + key_right)
    vsp = -5
    if (move != 0)
    {
        xscale = move
        if (movespeed < 4)
            movespeed += 0.5
        else if (movespeed > 5)
            movespeed -= 0.5
    }
    else
        movespeed = 0
    if (balloonbuffer > 0)
        balloonbuffer--
    else
    {
        create_particle(x, (y - 20), (9 << 0), 0)
        state = states.jump
        sprite_index = spr_fall
        jumpAnim = 0
    }
    if key_jump
    {
        create_particle(x, (y - 20), (9 << 0), 0)
        state = states.jump
        sprite_index = spr_jump
        image_index = 0
        jumpAnim = 1
        vsp = -11
        jumpstop = 0
    }
}

