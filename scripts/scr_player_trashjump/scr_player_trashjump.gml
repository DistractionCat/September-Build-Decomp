function scr_player_trashjump() //scr_player_trashjump
{
    image_speed = 0.35
    movespeed = 8
    hsp = (move * movespeed)
    move = (key_left + key_right)
    if (move != 0)
        xscale = move
    if (grounded && vsp > 0)
    {
        dir = xscale
        state = states.trashroll
        movespeed = 8
    }
}

