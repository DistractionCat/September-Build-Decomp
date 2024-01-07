function scr_player_motorcycle() //scr_player_motorcycle
{
    hsp = (xscale * movespeed)
    if (grounded || (!jumped))
        movespeed = Approach(movespeed, 13, 0.5)
    else
        movespeed = Approach(movespeed, 8, 0.5)
    if grounded
        jumped = 0
    sprite_index = spr_player_weeniemount
    if key_jump
        input_buffer_jump = 0
    if (grounded && input_buffer_jump < 8 && vsp > 0)
    {
        scr_soundeffect(sfx_jump)
        input_buffer_jump = 8
        vsp = -11
        jumped = 1
        jumpstop = 0
    }
    if ((!grounded) && (!key_jump2) && vsp < 0 && (!jumpstop))
    {
        vsp /= 10
        jumpstop = 1
    }
    if ((place_meeting((x + sign(hsp)), y, obj_solid) || scr_solid_slope((x + sign(hsp)), y)) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))) && (!(place_meeting((x + sign(hsp)), y, obj_slope))))
    {
        jumpstop = 0
        vsp = -11
        state = states.tumble
        sprite_index = spr_mach2jump
        repeat (5)
            create_debris(x, y, spr_motcycledebris)
    }
}

