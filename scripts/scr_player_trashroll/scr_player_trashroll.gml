function scr_player_trashroll() //scr_player_trashroll
{
    hsp = (xscale * movespeed)
    if (movespeed > 0 && grounded)
        movespeed -= 0.05
    if (scr_slope() && hsp != 0)
        scr_player_addslopemomentum(0.25, 0.5)
    movespeed = max(3, movespeed)
    if (sprite_index != spr_player_jumpdive1 && sprite_index != spr_player_jumpdive2)
        sprite_index = spr_crouchslip
    else
    {
        if (sprite_index == spr_player_jumpdive1 && floor(image_index) == (image_number - 1))
            sprite_index = spr_player_jumpdive2
        if (grounded && vsp > 0)
            sprite_index = spr_crouchslip
    }
    if key_jump2
    {
        dir = xscale
        state = states.jump
        jumpAnim = 1
        sprite_index = spr_jump
        image_index = 0
        jumpstop = 0
        vsp = -11
        momemtum = 1
    }
    if (((place_meeting((x + xscale), y, obj_solid) || place_meeting((x + xscale), y, obj_ghostwall)) && (!(place_meeting((x + hsp), y, obj_rollblock))) && (!(place_meeting((x + hsp), y, obj_rattumble))) && (!(place_meeting((x + hsp), y, obj_destructibles)))) || place_meeting(x, y, obj_timedgate))
    {
        state = states.bump
        hsp = ((-xscale) * 3)
        vsp = -3
    }
}

