function scr_enemy_walk() //scr_enemy_walk
{
    if (object_index != obj_spitcheese && object_index != obj_ninja && object_index != obj_trash && object_index != obj_fencer && object_index != obj_rancher && object_index != obj_banditochicken && object_index != obj_ancho && object_index != obj_pickle && object_index != obj_thug_red && object_index != obj_thug_green && object_index != obj_thug_blue)
        hsp = (image_xscale * (movespeed + (global.baddiespeed - 1)))
    else if (object_index == obj_pickle)
    {
        if (!walked)
        {
            hsp += (accel * sign(image_xscale))
            if (hsp < (-movespeed) || hsp > movespeed)
            {
                hsp = (movespeed * sign(image_xscale))
                walked = 1
            }
        }
        else
        {
            hsp -= (deccel * sign(image_xscale))
            if (hsp > (-deccel_threshold) && hsp < deccel_threshold)
                walked = 0
        }
    }
    if place_meeting(x, (y + 1), obj_railparent)
    {
        var _railinst = instance_place(x, (y + 1), obj_railparent)
        hsp += (_railinst.movespeed * _railinst.dir)
    }
    if ((!grounded) && object_index != obj_clownmato && object_index != obj_noisey && object_index != obj_ancho && object_index != obj_miniufo && object_index != obj_kentukybomber && object_index != obj_clownmato)
    {
        state = states.stun
        hsp = 0
    }
    if (turntimer > 0 && turner == 1)
        turntimer--
    if ((scr_solid((x + 1), y) && image_xscale == 1) || (scr_solid((x - 1), y) && image_xscale == -1) || place_meeting((x + hsp), y, obj_hallway) || turntimer <= 0)
    {
        if (!(place_meeting((x + sign(hsp)), y, obj_slope)))
        {
            if (object_index == obj_forknight)
            {
                image_xscale *= -1
                image_index = 0
                sprite_index = spr_forknight_turn
                state = states.idle
            }
            else if (object_index == obj_tank)
            {
                image_xscale *= -1
                image_index = 0
                sprite_index = spr_tank_turn
                state = states.idle
            }
            else
            {
                if (!turnstart)
                    turnstart = 1
                else
                    image_xscale *= -1
                if (object_index == obj_pickle)
                    hsp = 0
                if (object_index == obj_miniufo || object_index == obj_kentukybomber)
                    turntimer = turnmax
            }
            turntimer = turnmax
        }
    }
    if (object_index != obj_ancho)
    {
        if (!((scr_solid((x + (image_xscale * 15)), (y + 31)) || place_meeting((x + (image_xscale * 15)), (y + 31), obj_platform))))
        {
            if (movespeed > 0 && grounded)
            {
                if (object_index == obj_ninja)
                {
                }
                else if (object_index == obj_forknight)
                {
                    image_xscale *= -1
                    image_index = 0
                    sprite_index = spr_forknight_turn
                    state = states.idle
                }
                else if (object_index == obj_indiancheese)
                {
                    image_xscale *= -1
                    image_index = 0
                    sprite_index = spr_indiancheese_turn
                    state = states.idle
                }
                else if (object_index == obj_tank)
                {
                    image_xscale *= -1
                    image_index = 0
                    sprite_index = spr_tank_turn
                    state = states.idle
                }
                else
                {
                    image_xscale *= -1
                    if (object_index == obj_pickle)
                        hsp = 0
                }
                turntimer = turnmax
            }
        }
    }
}

