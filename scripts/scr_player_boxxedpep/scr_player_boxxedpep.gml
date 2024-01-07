function scr_player_boxxedpep() //scr_player_boxxedpep
{
    mask_index = spr_crouchmask
    image_speed = 0.35
    if key_jump
        input_buffer_jump = 0
    if ((!key_jump2) && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
    {
        vsp /= 2
        jumpstop = 1
    }
    if (grounded && vsp > 0)
        jumpstop = 0
    if (dir != xscale && (!key_attack))
    {
        dir = xscale
        movespeed = 0
    }
    if (sprite_index != spr_boxxedpepintro)
    {
        move = (key_left + key_right)
        if (!(place_meeting(x, (y + 1), obj_railparent)))
            hsp = (xscale * movespeed)
        else
        {
            var _railinst = instance_place(x, (y + 1), obj_railparent)
            hsp = ((xscale * movespeed) + (_railinst.movespeed * _railinst.dir))
        }
    }
    if (scr_solid((x + sign(hsp)), y) && xscale == 1 && move == 1 && ((!(place_meeting((x + 1), y, obj_slope))) || scr_solid_slope((x + 1), y)))
        movespeed = 0
    if (scr_solid((x + sign(hsp)), y) && xscale == -1 && move == -1 && ((!(place_meeting((x - 1), y, obj_slope))) || scr_solid_slope((x - 1), y)))
        movespeed = 0
    if (grounded && input_buffer_jump < 8 && vsp > 0 && (!(scr_solid(x, (y - 16)))) && (!(scr_solid(x, (y - 32)))))
    {
        instance_create(x, y, obj_highjumpcloud2)
        vsp = (-boxxedpepjump)
        state = states.boxxedpepjump
        sprite_index = spr_boxxedpepair
        jumpstop = 0
    }
    if (!key_attack)
    {
        if (sprite_index == spr_boxxedpepdash || sprite_index == spr_boxxedpepdashstart)
        {
            sprite_index = spr_boxxedpepdashend
            image_index = 0
        }
        if (sprite_index == spr_boxxedpepdashend && floor(image_index) == (image_number - 1))
            sprite_index = (move != 0 ? spr_boxxedpepwalk : spr_boxxedpepidle)
        if (move != 0)
        {
            if (movespeed < 6)
                movespeed += 0.5
            else if (floor(movespeed) == 6)
                movespeed = 6
        }
        else
            movespeed = 0
        if (movespeed > 6)
            movespeed -= 0.1
    }
    else
    {
        if (sprite_index != spr_boxxedpepdashstart && sprite_index != spr_boxxedpepdash)
        {
            sprite_index = spr_boxxedpepdashstart
            image_index = 0
        }
        if ((sprite_index == spr_boxxedpepdashstart && floor(image_index) == (image_number - 1)) || (sprite_index == spr_boxxedpepair && grounded))
            sprite_index = spr_boxxedpepdash
        if (movespeed < 10 && (!grounded))
        {
            if (dir != xscale)
            {
                dir = xscale
                movespeed = 0
            }
            if (move != 0)
            {
                if (movespeed < 6)
                    movespeed += 0.5
                else if (floor(movespeed) == 6)
                    movespeed = 6
                xscale = move
            }
            else
                movespeed = 0
        }
        else
            movespeed = 10
    }
    if (sprite_index == spr_boxxedpepintro && floor(image_index) == (image_number - 1))
        sprite_index = spr_boxxedpepidle
    if (sprite_index != spr_boxxedpepintro)
    {
        if (move != 0 && (!key_attack))
            xscale = move
        if grounded
        {
            if ((!key_attack) && sprite_index != spr_boxxedpepdashend)
            {
                if (move != 0)
                    sprite_index = spr_boxxedpepwalk
                else
                    sprite_index = spr_boxxedpepidle
            }
        }
        else
        {
            sprite_index = spr_boxxedpepair
            state = states.boxxedpepjump
        }
    }
    if key_slap2
    {
        state = states.boxxedpepspin
        sprite_index = spr_boxxedpepdashstart
        movespeed = 12
        image_index = 0
    }
    if ((!instance_exists(obj_cloudeffect)) && grounded && move != 0 && (floor(image_index) == 4 || floor(image_index) == 10))
        instance_create(x, (y + 43), obj_cloudeffect)
    if ((!instance_exists(obj_cloudeffect)) && grounded && move != 0 && (sprite_index == spr_player_downslopes || sprite_index == spr_player_upslopes))
        instance_create(x, (y + 43), obj_cloudeffect)
    if (move != 0 && (floor(image_index) == 3 || floor(image_index) == 8) && steppy == 0)
        steppy = 1
    if (move != 0 && floor(image_index) != 3 && floor(image_index) != 8)
        steppy = 0
}

