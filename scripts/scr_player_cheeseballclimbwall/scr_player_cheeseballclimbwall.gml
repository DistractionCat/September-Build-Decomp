function scr_player_cheeseballclimbwall() //scr_player_cheeseballclimbwall
{
    hsp = 0
    vsp = (-wallspeed)
    if (scr_solid(x, (y - 1)) && (!(place_meeting(x, (y - 1), obj_destructibles))) && ((!(place_meeting((x + sign(hsp)), y, obj_slope))) || scr_solid_slope((x + sign(hsp)), y)) && (!(place_meeting((x - sign(hsp)), y, obj_slope))))
    {
        sprite_index = spr_superjumpland
        scr_soundeffect(sfx_groundpound)
        image_index = 0
        state = states.Sjumpland
        machhitAnim = 0
        repeat (4)
            create_debris(x, y, spr_slimedebris)
    }
    if (!(scr_solid((x + xscale), y)))
    {
        instance_create(x, y, obj_jumpdust)
        vsp = 0
        state = states.cheeseball
        movespeed = wallspeed
    }
    if key_jump
    {
        vsp = -11
        state = states.cheeseball
        xscale *= -1
    }
}

