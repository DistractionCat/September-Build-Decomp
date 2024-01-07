if (instance_number(object_index) > 1)
{
    instance_destroy()
    return;
}
depth = -7
gpu_set_alphatestref(244)
finisher_alpha = 0
use_lighting = 0
flash = 0
surf = surface_create(960, 540)
surface_set_target(surf)
draw_clear_alpha(c_black, 0)
surface_reset_target()
bg_alpha = 0.8
circle_alpha_out = 0.4
circle_alpha_in = 1
circle_size_out = 178
circle_size_in = 128
