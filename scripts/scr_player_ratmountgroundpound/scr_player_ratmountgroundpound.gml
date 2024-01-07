function scr_player_ratmountgroundpound() //scr_player_ratmountgroundpound
{
    if (sprite_index == spr_player_ratmountgroundpound)
    {
        if (floor(image_index) == (image_number - 1))
            sprite_index = spr_player_ratmountgroundpoundfall
    }
    move = (key_left + key_right)
    hsp = (move * movespeed)
    if (dir != xscale)
    {
        movespeed = 0
        dir = xscale
    }
    if (move != 0)
    {
        xscale = move
        if (movespeed < 6)
            movespeed += 0.5
    }
    else
        movespeed = 0
    if grounded
    {
        state = states.ratmount
        landAnim = 1
        sprite_index = spr_player_ratmountland
        image_index = 0
        create_particle(x, y, (9 << 0), 0)
    }
}

