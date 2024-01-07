function scr_player_ghost() //scr_player_ghost
{
    visible = true
    image_speed = 0.35
    if (sprite_index != spr_ghostdash && sprite_index != spr_ghostend)
    {
        move_h = (key_right + key_left)
        move_v = (key_down - key_up)
        hsp = Approach(hsp, (move_h * 6), 0.4)
        vsp = Approach(vsp, (move_v * 6), 0.4)
        if (hsp != 0)
            xscale = sign(hsp)
        if (move_v < 0)
            sprite_index = spr_ghostjump
        else
            sprite_index = spr_ghostidle
        if key_slap2
        {
            sprite_index = spr_ghostdash
            image_index = 0
            vsp = 0
        }
        if (place_meeting(x, y, obj_tombstone) && sprite_index != spr_ghostend)
        {
            sprite_index = spr_ghostend
            image_index = 0
            image_alpha = 1
            vsp = 10
            hsp = 0
            grav = 0.5
            movespeed = 0
            with (instance_place(x, y, obj_tombstone))
            {
                other.x = x
                other.y = y
            }
        }
    }
    if (sprite_index == spr_ghostdash)
    {
        hsp = (xscale * 10)
        if (floor(image_index) == (image_number - 1))
            sprite_index = spr_ghostidle
        if place_meeting((x + hsp), y, obj_baddie)
        {
            var num = instance_place_list((x + hsp), y, obj_baddie, global.instancelist, false)
            var i = 0
            while (i < num)
            {
                var b = ds_list_find_value(global.instancelist, i)
                if b.is_controllable
                {
                    key_slap2 = 0
                    state = states.ghostpossess
                    possessID = b.id
                    with (b)
                    {
                        state = states.ghostpossess
                        playerid = other.id
                    }
                    create_particle(x, y, (9 << 0), 0)
                    break;
                }
                else
                {
                    i++
                    continue
                }
            }
            ds_list_clear(global.instancelist)
        }
    }
    if (sprite_index == spr_ghostend && floor(image_index) == (image_number - 1))
        state = states.normal
    if (place_meeting(x, y, obj_ghosttransparency) && sprite_index != spr_ghostend)
        image_alpha = 0.5
    else
        image_alpha = 1
}

function scr_player_ghostpossess() //scr_player_ghostpossess
{
    visible = false
    hsp = 0
    if (!instance_exists(possessID))
    {
        visible = true
        state = states.ghost
        sprite_index = spr_ghostidle
    }
}

