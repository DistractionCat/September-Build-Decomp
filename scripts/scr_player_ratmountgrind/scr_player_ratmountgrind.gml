function scr_player_ratmountgrind() //scr_player_ratmountgrind
{
    hsp = (move * movespeed)
    vsp = 0
    move = (key_left + key_right)
    if (move != 0)
    {
        xscale = move
        movespeed = 6
    }
    else
        movespeed = 0
    if (!(place_meeting(x, y, obj_grindrailslope)))
    {
        with (instance_place(x, y, obj_grindrail))
            other.y = y
    }
    if (move != 0)
    {
        var inst = instance_place((x + hsp), (y - 32), obj_grindrailslope)
        if (inst == noone)
            inst = instance_place((x + hsp), (y + 32), obj_grindrailslope)
        with (inst)
        {
            if (other.xscale == sign(image_xscale))
                other.vsp = -5
            else
                other.vsp = 5
        }
    }
    ds_list_clear(global.instancelist)
    if ((!(place_meeting(x, y, obj_grindrail))) && (!(place_meeting(x, y, obj_grindrailslope))))
    {
        state = states.ratmountjump
        sprite_index = spr_player_ratmountfall
    }
    if key_jump
    {
        state = states.ratmountjump
        vsp = -11
        jumpstop = 0
        jumpAnim = 1
        sprite_index = spr_player_ratmountjump
        create_particle(x, y, (3 << 0), 0)
    }
}

