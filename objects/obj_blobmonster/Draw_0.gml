var yy = 0
if (yscale < 0)
    yy = 60
draw_sprite_ext(sprite_index, image_index, x, (y + yy), image_xscale, yscale, image_angle, image_blend, image_alpha)
