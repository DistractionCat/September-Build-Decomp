function scr_player_boxxedpepjump() //scr_player_boxxedpepjump
{
    sprite_index = spr_boxxedpepair
    move = (key_left + key_right)
    if (!(place_meeting(x, (y + 1), obj_railparent)))
        hsp = (xscale * movespeed)
    else
    {
        var _railinst = instance_place(x, (y + 1), obj_railparent)
        hsp = ((xscale * movespeed) + (_railinst.movespeed * _railinst.dir))
    }
    if (scr_solid((x + sign(hsp)), y) && xscale == move && ((!(place_meeting((x + xscale), y, obj_slope))) || scr_solid_slope((x + xscale), y)))
        movespeed = 0
    if (dir != xscale)
    {
        dir = xscale
        movespeed = 0
    }
    if ((!key_jump2) && (!jumpstop) && vsp < 0)
    {
        jumpstop = 1
        vsp /= 10
    }
    if (move != 0)
    {
        xscale = move
        if (movespeed < 6)
            movespeed += 0.5
        else if (floor(movespeed) == 6)
            movespeed = 6
    }
    else
        movespeed = 0
    if (movespeed > 6)
        movespeed -= 0.1
    if grounded
    {
        state = states.boxxedpep
        sprite_index = spr_boxxedpepidle
    }
    if key_jump
    {
        jumpstop = 0
        instance_create(x, y, obj_highjumpcloud2)
        state = states.boxxedpepjump
        boxxedpepjump *= 0.8
        vsp = (-boxxedpepjump)
    }
    if key_slap2
    {
        state = states.boxxedpepspin
        sprite_index = spr_boxxedpepdashstart
        image_index = 0
        movespeed = 10
        vsp = 0
    }
}

