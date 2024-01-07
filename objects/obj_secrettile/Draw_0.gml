if (array_length(tiles) > 0)
{
    for (var k = 0; k < array_length(tilemap_sprite); k++)
    {
        if (tilemap_sprite[k] != -4)
        {
            var _w = (sprite_get_width(tilemap_sprite[k]) / 32)
            for (var i = 0; i < array_length(tiles[k]); i++)
            {
                var b = tiles[k][i]
                var _index = b[0]
                var xi = 0
                var yi = 0
                for (var j = 0; j < _index; j++)
                {
                    xi++
                    if (xi >= _w)
                    {
                        xi = 0
                        yi++
                    }
                }
                var _l = (xi * 32)
                var _t = (yi * 32)
                draw_sprite_part_ext(tilemap_sprite[k], 0, _l, _t, 32, 32, b[1], b[2], 1, 1, c_white, alpha)
            }
        }
    }
}
