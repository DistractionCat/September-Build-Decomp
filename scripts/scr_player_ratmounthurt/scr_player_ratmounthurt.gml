function scr_player_ratmounthurt() //scr_player_ratmounthurt
{
    hsp = ((-xscale) * movespeed)
    landAnim = 0
    jumpAnim = 0
    hurted = 1
    if (movespeed > 0)
        movespeed -= 0.1
    alarm[5] = 2
    alarm[7] = 20
    if grounded
        vsp = -4
    if scr_solid((x + hsp), y)
        xscale *= -1
    sprite_index = spr_player_ratmounthurt
    image_speed = 0.35
}

