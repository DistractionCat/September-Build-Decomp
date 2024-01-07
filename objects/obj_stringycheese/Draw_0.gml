draw_self()
draw_sprite_ext(spr_stringyarm, -1, x, (y + 12), abs((point_distance(x, y, drawhandx, drawhandy) / sprite_get_width(spr_stringyarm))), 1, point_direction(x, y, handx, handy), c_white, 1)
draw_sprite(spr_grabbiehand_idle, -1, drawhandx, drawhandy)
