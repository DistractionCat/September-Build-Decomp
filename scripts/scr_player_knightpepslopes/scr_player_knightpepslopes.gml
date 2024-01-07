function scr_player_knightpepslopes() //scr_player_knightpepslopes
{
    if ((x + hsp) == xprevious)
        slope_buffer--
    else
        slope_buffer = 20
    alarm[5] = 2
    alarm[7] = 60
    hurted = 1
    if (knightmiddairstop == 0)
        hsp = (xscale * movespeed)
    if (knightmiddairstop != 0)
    {
        hsp = 0
        vsp = 0
        knightmiddairstop--
    }
    else if (knightmove == 0)
    {
        vsp = -11
        doublejump = 1
        sprite_index = spr_knightpep_doublejump
        knightmove = -1
    }
    if (movespeed == 0)
        state = states.knightpep
    if key_jump
        input_buffer_jump = 0
    if ((!key_jump2) && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
    {
        vsp /= 2
        jumpstop = 1
    }
    if (grounded && vsp > 0)
        jumpstop = 0
    if ((!scr_slope()) && ((sprite_index != spr_knightpepjump && sprite_index != spr_knightpepfall && sprite_index != spr_knightpep_doublejump) || grounded))
        sprite_index = spr_knightpepcharge
    if scr_slope()
        sprite_index = spr_knightpepdownslope
    if (input_buffer_jump < 8)
    {
        if (grounded || (!doublejump))
        {
            vsp = -11
            sprite_index = spr_knightpepjump
            image_index = 0
            input_buffer_jump = 8
            if (!grounded)
            {
                knightmove = 0
                knightmiddairstop = 10
            }
        }
    }
    if (sprite_index == spr_knightpepjump && floor(image_index) == (image_number - 1))
        sprite_index = spr_knightpepfall
    if (sprite_index == spr_knightpep_doublejump && floor(image_index) == (image_number - 1))
        image_index = (image_number - 1)
    if (scr_solid((x + sign(hsp)), y) && ((!scr_slope()) || place_meeting((x + sign(hsp)), (y - 2), obj_solid)) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))))
    {
        if (!scr_slope())
        {
            movespeed = 5
            vsp = -6
            sprite_index = spr_knightpep_doublejump
            image_index = 0
            state = states.knightpepbump
            scr_soundeffect(sfx_groundpound)
        }
        else
            movespeed = 0
    }
    if scr_slope()
    {
        var s1 = 0.25
        var s2 = 0.5
        if (sign(instance_place(x, (y + 1), obj_slope).image_xscale) == sign(xscale))
        {
            s1 = 0.05
            s2 = 0.2
        }
        scr_player_addslopemomentum(s1, s2)
        if (movespeed <= 0 && grounded)
        {
            movespeed = 0
            with (instance_place(x, (y + 1), obj_slope))
                other.xscale = (-sign(image_xscale))
            sprite_index = spr_knightpepidle
            state = states.knightpep
        }
    }
    else if (movespeed <= 5 && grounded && vsp > 0)
        movespeed = Approach(movespeed, 0, 0.05)
    if (movespeed <= 0 && sprite_index == spr_knightpepcharge)
    {
        sprite_index = spr_knightpepidle
        state = states.knightpep
    }
    if ((!grounded) && key_down2 && sprite_index != spr_knightpep_downtrust)
    {
        knightmove = 1
        knightmiddairstop = 10
        state = states.knightpep
    }
}

