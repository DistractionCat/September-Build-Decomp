if global.kungfu
{
    if (global.hp == 8)
        draw_sprite(spr_pizzahealthbar, 0, 190, 70)
    else if (global.hp == 7)
        draw_sprite(spr_pizzahealthbar, 1, 190, 70)
    else if (global.hp == 6)
        draw_sprite(spr_pizzahealthbar, 2, 190, 70)
    else if (global.hp == 5)
        draw_sprite(spr_pizzahealthbar, 3, 190, 70)
    else if (global.hp == 4)
        draw_sprite(spr_pizzahealthbar, 4, 190, 70)
    else if (global.hp == 3)
        draw_sprite(spr_pizzahealthbar, 5, 190, 70)
    else if (global.hp == 2)
        draw_sprite(spr_pizzahealthbar, 6, 190, 70)
    else if (global.hp == 1)
        draw_sprite(spr_pizzahealthbar, 7, 190, 70)
    else if (global.hp == 0)
        draw_sprite(spr_pizzahealthbar, 8, 190, 70)
}
if (obj_player.state != states.gameover)
{
    if (obj_player.x < 250 && obj_player.y < 169)
        hud_posY = Approach(hud_posY, -300, 15)
    else
        hud_posY = Approach(hud_posY, 0, 15)
    pizzascore_index += (0 + (0.25 * global.stylethreshold))
    if (pizzascore_index > (pizzascore_number - 1))
        pizzascore_index = (0 + frac(pizzascore_index))
    if (global.stylethreshold <= 0)
    {
        if (floor(pizzascore_index) != 0)
            pizzascore_index += 0.35
        else
            pizzascore_index = 0
    }
    var sw = sprite_get_width(spr_heatmeter_fill)
    var sh = sprite_get_height(spr_heatmeter_fill)
    var b = (global.style / 55)
    var hud_xx = (121 + irandom_range((-collect_shake), collect_shake))
    var hud_yy = ((70 + irandom_range((-collect_shake), collect_shake)) + hud_posY)
    draw_sprite_part(spr_heatmeter_fill, pizzascore_index, 0, 0, (sw * b), sh, (hud_xx - 95), (hud_yy + 24))
    shader_set(global.Pal_Shader)
    pal_swap_set(spr_heatmeter_palette, global.stylethreshold, 0)
    draw_sprite_ext(spr_heatmeter, pizzascore_index, hud_xx, hud_yy, 1, 1, 0, c_white, alpha)
    shader_reset()
    draw_sprite_ext(spr_pizzascore, pizzascore_index, hud_xx, hud_yy, 1, 1, 0, c_white, alpha)
    var _score = global.collect
    if global.coop
        _score += global.collectN
    if (_score >= global.crank)
        draw_sprite_ext(spr_pizzascore_pepper, pizzascore_index, hud_xx, hud_yy, 1, 1, 0, c_white, alpha)
    if (_score >= global.brank)
        draw_sprite_ext(spr_pizzascore_pepperoni, pizzascore_index, hud_xx, hud_yy, 1, 1, 0, c_white, alpha)
    if (_score >= global.arank)
        draw_sprite_ext(spr_pizzascore_olive, pizzascore_index, hud_xx, hud_yy, 1, 1, 0, c_white, alpha)
    if (_score >= global.srank)
        draw_sprite_ext(spr_pizzascore_shroom, pizzascore_index, hud_xx, hud_yy, 1, 1, 0, c_white, alpha)
    draw_set_valign(fa_top)
    draw_set_halign(fa_left)
    draw_set_font(global.collectfont)
    var text_y = 0
    switch floor(pizzascore_index)
    {
        case 1:
        case 2:
        case 3:
            text_y = 1
            break;
        case 5:
        case 10:
            text_y = -1
            break;
        case 6:
        case 9:
            text_y = -2
            break;
        case 7:
            text_y = -3
            break;
        case 8:
            text_y = -5
            break;
    }

    var str = string(_score)
    var num = string_length(str)
    var w = string_width(str)
    var xx = (hud_xx - (w / 2))
    if (lastcollect != _score)
    {
        color_array = array_create(num, 0)
        for (var i = 0; i < array_length(color_array); i++)
            color_array[i] = choose(irandom(3))
        lastcollect = _score
    }
    shader_set(global.Pal_Shader)
    draw_set_alpha(alpha)
    for (i = 0; i < num; i++)
    {
        var yy = (((i + 1) % 2) == 0 ? -5 : 0)
        var c = color_array[i]
        pal_swap_set(spr_font_palette, c, 0)
        draw_text(xx, (((hud_yy - 56) + text_y) + yy), string_char_at(str, (i + 1)))
        xx += (w / num)
    }
    draw_set_alpha(1)
    shader_reset()
    draw_set_font(global.bigfont)
    draw_set_halign(fa_center)
    draw_set_color(c_white)
    var _chunk = floor(global.fill)
    var _color = c_white
    if (_chunk < 5 || obj_player.state == states.hurt)
        _color = c_red
    if (_chunk == 25)
        _color = c_yellow
    var _panicshake = 0
    if (global.panic == 1 || obj_player.state == states.hurt)
        _panicshake = 1
    if (global.panic == 1)
        draw_text_color((random_range(_panicshake, (-_panicshake)) + 480), (random_range(_panicshake, (-_panicshake)) + 480), _chunk, _color, _color, _color, _color, 1)
    if (obj_player1.character == "V")
        draw_text((200 + healthshake), (125 + healthshake), global.playerhealth)
    draw_sprite_ext(spr_inv, -1, 41, 150, 1, 1, 1, c_white, alpha)
    if global.key_inv
        draw_sprite_ext(spr_key, -1, 41, 150, 1, 1, 1, c_white, alpha)
}
