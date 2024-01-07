if (room == rm_editor)
    return;
var playerid = instance_place(x, (y - 1), obj_player)
with (playerid)
{
    if (character == "V")
        scr_hurtplayer(id)
    else if (state != states.boots && state != states.gameover && state != states.rideweenie && state != states.gotoplayer)
    {
        var _pindex = (object_index == obj_player1 ? 0 : 1)
        GamepadSetVibration(_pindex, 1, 1, 0.85)
        if (state != states.fireass)
            tv_push_prompt_once(tv_create_prompt("This is the fireass transformation text", (2 << 0), 573, 3), "fireass")
        state = states.fireass
        vsp = -25
        sprite_index = spr_fireass
        image_index = 0
        if (!audio_is_playing(sfx_scream5))
            scr_soundeffect(sfx_scream5)
    }
}
