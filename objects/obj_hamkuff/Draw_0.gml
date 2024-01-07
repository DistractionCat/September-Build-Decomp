if (state == states.blockstance)
{
    var dis = point_distance(x, y, obj_player1.x, obj_player1.y)
    var w = 24
    var len = (dis div w)
    var dir = point_direction(x, (y + 32), playerid.x, (playerid.y + 16))
    var xx = lengthdir_x(w, dir)
    var yy = lengthdir_y(w, dir)
    for (var i = 0; i < len; i++)
        draw_sprite_ext(spr_hamkuff_sausage, -1, (x + (xx * i)), ((y + 32) + (yy * i)), 1, 1, dir, c_white, 1)
}
