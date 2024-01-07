draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_color(c_white)
draw_set_font(global.bigfont)
var _levelinfo = level_array[selected_world][selected_level]
draw_text(480, 270, concat(world_array[selected_world], "\n", (selected_level + 1), ". ", _levelinfo[0]))
draw_set_halign(fa_left)
draw_set_valign(fa_bottom)
draw_set_valign(fa_top)
