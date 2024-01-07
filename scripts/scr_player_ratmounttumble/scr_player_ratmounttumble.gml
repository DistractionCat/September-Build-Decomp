function scr_player_ratmounttumble() //scr_player_ratmounttumble
{
    hsp = (xscale * movespeed)
    move = (key_left + key_right)
    sprite_index = spr_player_ratmountwalljump
    if grounded
        movespeed -= 0.05
    if (scr_slope() && hsp != 0)
        scr_player_addslopemomentum(0.25, 0.5)
    if (((place_meeting((x + xscale), y, obj_solid) || place_meeting((x + xscale), y, obj_ghostwall)) && (!(scr_solid_slope((x + xscale), y))) && (!(place_meeting((x + hsp), y, obj_rollblock))) && (!(place_meeting((x + hsp), y, obj_rattumble))) && (!(place_meeting((x + hsp), y, obj_destructibles)))) || place_meeting(x, y, obj_timedgate))
    {
        hsp = 0
        movespeed = 0
    }
    if key_jump
    {
        state = states.ratmountbounce
        vsp = -11
        sprite_index = spr_player_ratmountwalljump
    }
    if (movespeed <= 2)
        state = states.ratmount
    if (key_attack2 && grounded && (!(scr_solid(x, (y - 16)))) && (!(scr_solid(x, (y - 32)))))
    {
        with (instance_create(x, y, obj_jumpdust))
            image_xscale = other.xscale
        state = states.ratmount
    }
}

