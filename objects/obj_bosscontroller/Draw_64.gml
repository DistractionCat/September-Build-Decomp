var _temp_local_var_1, _temp_local_var_17;
if (bossID == noone)
    return;
if (!instance_exists(bossID))
    return;
if bossID.destroyed
    return;
if bossID.playerdestroyed
    return;
switch state
{
    case states.arenaintro:
        draw_sprite_tiled(spr_versusflame, -1, 0, flamey)
        var sprplayer = (playerx != 0 ? playersprshadow : playerspr)
        var sprboss = (playerx != 0 ? bosssprshadow : bossspr)
        draw_sprite(sprplayer, -1, playerx, (room_height - sprite_get_height(sprplayer)))
        draw_sprite(sprboss, -1, bossx, (room_height - sprite_get_height(sprboss)))
        var xx = irandom_range(-1, 1)
        var yy = irandom_range(-1, 1)
        draw_sprite(vstitle, -1, xx, (vsy + yy))
        if flash
        {
            shader_set(shd_hit)
            draw_sprite(sprplayer, -1, playerx, (room_height - sprite_get_height(sprplayer)))
            draw_sprite(sprboss, -1, bossx, (room_height - sprite_get_height(sprboss)))
            draw_sprite(vstitle, -1, xx, (vsy + yy))
            shader_reset()
        }
        return;
    case (145 << 0):
        draw_set_halign(fa_center)
        var str = concat("ROUND ", round_count)
        draw_text((480 + irandom_range(-1, 1)), (78 + irandom_range(-1, 1)), str)
        break;
    case states.normal:
        draw_set_halign(fa_center)
        var textseconds = (seconds < 10 ? ("0" + string(seconds)) : string(seconds))
        var _color = ((seconds <= 30 && minutes == 0) ? c_red : c_white)
        var _temp_local_var_17 = (_color == c_red ? irandom_range(-1, 1) : 0)
        draw_text_color((480 + (_color == 255 ? irandom_range(-1, 1) : 0)), (78 + 480), ((string(minutes) + ":") + textseconds), _color, _color, _color, _color, 1)
        break;
}

draw_healthbar(64, 192, 448, 224, ((player_hp / player_hpmax) * 100), c_dkgray, c_red, c_red, 0, 1, 1)
var _boss_hp = (instance_exists(bossID) ? ((bossID.hp / bossID.max_hp) * 100) : 0)
draw_healthbar(512, 192, 896, 224, _boss_hp, c_dkgray, c_red, c_red, 1, 1, 1)
