if use_lighting
{
    var cw = (camera_get_view_width(view_camera[0]) + 32)
    var ch = (camera_get_view_height(view_camera[0]) + 32)
    if (!surface_exists(surf))
    {
        surf = surface_create(cw, ch)
        surface_set_target(surf)
        draw_clear_alpha(c_black, 0)
        surface_reset_target()
    }
    if surface_exists(surf)
    {
        surface_resize(surf, cw, ch)
        surface_set_target(surf)
        draw_set_color(c_black)
        draw_set_alpha(bg_alpha)
        draw_rectangle(0, 0, cw, ch, false)
        gpu_set_blendmode(bm_subtract)
        draw_set_color(c_white)
        var surf_x = camera_get_view_x(view_camera[0])
        var surf_y = camera_get_view_y(view_camera[0])
        for (var i = 0; i < 2; i++)
        {
            var _player = asset_get_index(concat("obj_player", (i + 1)))
            draw_set_alpha(circle_alpha_out)
            with (_player)
            {
                if (state != states.gotoplayer)
                    draw_circle(((x - surf_x) + irandom_range(-1, 1)), ((y - surf_y) + irandom_range(-1, 1)), 178, 0)
            }
            draw_set_alpha(circle_alpha_in)
            with (_player)
            {
                if (state != states.gotoplayer)
                    draw_circle(((x - surf_x) + irandom_range(-1, 1)), ((y - surf_y) + irandom_range(-1, 1)), 128, 0)
            }
        }
        gpu_set_blendmode(bm_normal)
        draw_set_alpha(1)
        surface_reset_target()
        draw_surface(surf, surf_x, surf_y)
    }
}
