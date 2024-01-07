draw_set_font(global.bigfont)
draw_set_halign(fa_center)
draw_set_color(c_white)
if global.use_temperature
{
    var _width = sprite_get_width(spr_temperature_meterfill)
    var _height = sprite_get_height(spr_temperature_meterfill)
    global.temperature = clamp(global.temperature, 0, (global.temp_thresholdnumber * 100))
    var _tmp = (global.temperature / (global.temp_thresholdnumber * 100))
    var _top = 0
    var _height2 = (_height * _tmp)
    draw_sprite_part_ext(spr_temperature_meterfill, 0, 0, _top, _width, _height2, 864, (192 + _height), 1, -1, c_white, 1)
    draw_sprite(spr_temperature_meter, 0, 864, 192)
}
if ((obj_player1.state == states.trickjump || obj_player1.state == states.ratmounttrickjump) && obj_player1.ramp)
    draw_text((obj_player1.x - camera_get_view_x(view_camera[0])), ((obj_player1.y - 100) - camera_get_view_y(view_camera[0])), concat("X", obj_player1.ramp_points, " TRICKS", "\nTAUNT"))
var collect_x = irandom_range((-collect_shake), collect_shake)
var collect_y = irandom_range((-collect_shake), collect_shake)
var tv_x = 845
var tv_y = 80
if (room != strongcold_endscreen)
    draw_sprite_ext(sprite_index, image_index, (tv_x + collect_x), ((tv_y + collect_y) + hud_posY), 1, 1, 0, c_white, alpha)
if (global.combo != 0 && sprite_index != spr_tv_open && sprite_index != spr_tv_off)
{
    draw_sprite_ext(spr_tv_combo, image_index, (tv_x + collect_x), ((tv_y + collect_y) + hud_posY), 1, 1, 0, c_white, alpha)
    var str = string(global.combo)
    if (global.combo < 10)
        str = concat("0", str)
    draw_set_halign(fa_left)
    draw_set_valign(fa_top)
    draw_set_font(global.combofont)
    var num = string_length(str)
    var w = (string_width(str) / num)
    var xx = 0
    var yy = 0
    for (var i = 0; i < num; i++)
    {
        var char = string_char_at(str, (i + 1))
        xx = (i * w)
        yy = (i * 5)
        draw_text(((tv_x - 44) + xx), (((tv_y - 16) - yy) + hud_posY), char)
    }
}
if (bubblespr != -4)
    draw_sprite_ext(bubblespr, bubbleindex, 512, (53 + hud_posY), 1, 1, 1, c_white, alpha)
if (!surface_exists(promptsurface))
    promptsurface = surface_create(290, 102)
surface_set_target(promptsurface)
draw_clear_alpha(c_black, 0)
draw_set_font(font1)
draw_set_halign(fa_left)
draw_set_valign(fa_middle)
if (bubblespr == spr_tv_bubble)
{
    promptx -= promptspd
    if (bubblespr != spr_tv_bubbleclose && promptx < (350 - string_width(prompt)))
    {
        bubblespr = spr_tv_bubbleclose
        bubbleindex = 0
    }
    draw_text_color((promptx - 350), 50, prompt, c_black, c_black, c_black, c_black, 1)
}
draw_set_halign(fa_left)
surface_reset_target()
draw_surface(promptsurface, 350, hud_posY)
draw_set_font(global.smallnumber_fnt)
draw_set_halign(fa_center)
if instance_exists(obj_pizzaball)
    draw_text(832, 300, ((string(global.golfhit) + " ") + "GOLF HIT"))
var barxx = -26
var baryy = 30
draw_sprite(spr_barpop, 0, (832 + barxx), (250 + baryy))
var sw = sprite_get_width(spr_barpop)
var sh = sprite_get_height(spr_barpop)
var b = (global.combotime / 55)
draw_sprite_part(spr_barpop, 1, 0, 0, (sw * b), sh, (832 + barxx), (250 + baryy))
