function scr_player_cheeseball() //scr_player_cheeseball
{
    image_speed = 0.35
    if ((x + hsp) == xprevious)
        stop_buffer--
    else
        stop_buffer = 8
    hsp = (xscale * 12)
    if (instance_place((x + sign(hsp)), y, obj_solid) && (!(place_meeting((x + sign(hsp)), y, obj_cheeseballblock))) && ((!(place_meeting((x + sign(hsp)), y, obj_ratblock))) || place_meeting((x + sign(hsp)), y, obj_rattumble)))
    {
        state = states.cheeseballclimbwall
        wallspeed = 12
    }
    sprite_index = spr_cheeseballplayer
    if ((!grounded) && key_down)
        vsp = 10
    if key_jump
        input_buffer_jump = 0
    if ((!key_jump2) && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
    {
        vsp /= 20
        jumpstop = 1
    }
    if (grounded && vsp > 0)
        jumpstop = 0
    if (input_buffer_jump < 8 && grounded)
    {
        instance_create(x, y, obj_highjumpcloud2)
        vsp = -11
    }
}

