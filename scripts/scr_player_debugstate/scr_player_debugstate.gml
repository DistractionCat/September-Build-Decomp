function scr_player_debugstate() //scr_player_debugstate
{
    var _spd = 6
    if key_attack
        _spd = 10
    hsp = ((key_left + key_right) * _spd)
    vsp = ((-((key_up - key_down))) * _spd)
    sprite_index = spr_idle
    if key_jump
        state = states.normal
}

