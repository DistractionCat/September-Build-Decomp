if (state == states.transitioncutscene || state == states.victory || state == states.gameover)
{
    draw_set_alpha(fade)
    var cx = camera_get_view_x(view_camera[0])
    var cy = camera_get_view_y(view_camera[0])
    var cw = camera_get_view_width(view_camera[0])
    var ch = camera_get_view_height(view_camera[0])
    draw_rectangle_color(cx, cy, (cx + cw), (cy + ch), c_white, c_white, c_white, c_white, 0)
    draw_set_alpha(1)
}
