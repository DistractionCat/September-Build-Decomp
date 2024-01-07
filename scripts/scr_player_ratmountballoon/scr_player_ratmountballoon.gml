function scr_player_ratmountballoon() //scr_player_ratmountballoon
{
    sprite_index = spr_player_ratmountidle2
    hsp = (move * movespeed)
    move = (key_left + key_right)
    vsp = 2
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
    var _jump = 0
    if (balloonbuffer > 0)
        balloonbuffer--
    else
        _jump = 1
    if key_jump
        _jump = 1
    if _jump
    {
        create_particle(x, (y - 20), (9 << 0), 0)
        create_particle(x, y, (3 << 0), 0)
        state = states.ratmountjump
        sprite_index = spr_player_ratmountjump
        image_index = 0
        jumpAnim = 1
        vsp = -20
        jumpstop = 1
    }
}

