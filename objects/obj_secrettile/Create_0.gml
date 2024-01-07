alpha = 1
depth = -8
tiles[0] = array_create(0)
tiles[1] = array_create(0)
tiles[2] = array_create(0)
for (var i = 0; i < 3; i++)
{
    var lay_id = layer_get_id(concat("Tiles_Secret", (i + 1)))
    tilemap_sprite[i] = -4
    if (lay_id != -1)
    {
        var map_id = layer_tilemap_get_id(lay_id)
        var ts = tilemap_get_tileset(map_id)
        var t = -4
        switch ts
        {
            case 64:
                t = tile_ruin
                break;
            case 65:
                t = tile_ruin2
                break;
            case 80:
                t = sprite_tile_beachtest
                break;
            case 81:
                t = sprite_tile_beachtest2
                break;
            case 84:
                t = sprite_tile_beachtest2dark
                break;
            case 69:
                t = tile_chateau1
                break;
            case 39:
                t = tile_desert
                break;
            case 41:
                t = tile_ufo
                break;
            case 40:
                t = tile_cavern
                break;
            case 66:
                t = tile_dungeon
                break;
            case 67:
                t = tile_dungeon2
                break;
            case 68:
                t = tile_dungeon3
                break;
            case 55:
                t = tile_entrance1
                break;
            case 54:
                t = tile_tower
                break;
            case 76:
                t = tile_farm
                break;
            case 85:
                t = sprite_tile_forest
                break;
            case 86:
                t = sprite_tile_forest1_shade
                break;
            case 87:
                t = sprite_tile_forest2
                break;
            case 104:
                t = bg_tilefreezer
                break;
            case 17:
                t = tile_freezer2
                break;
            case 73:
                t = tile_graveyard1
                break;
            case 75:
                t = tile_graveyard3
                break;
            case 74:
                t = tile_graveyard2
                break;
            case 37:
                t = tile_factory
                break;
            case 18:
                t = tile_factory2424
                break;
            case 106:
                t = spr_kidspartytile
                break;
            case 89:
                t = sprite_tile_kungfu
                break;
            case 90:
                t = tile_kunfucity
                break;
            case 91:
                t = sprite_tile_kungfustructure
                break;
            case 8:
                t = spr_mansiontile2
                break;
            case 45:
                t = tile_castle
                break;
            case 61:
                t = tile_medieval
                break;
            case 62:
                t = tile_medieval2
                break;
            case 63:
                t = tile_medieval3
                break;
            case 92:
                t = sprite_tile_minigolf
                break;
            case 93:
                t = sprite_tile_minigolf2
                break;
            case 94:
                t = sprite_tile_minigolf2_shad
                break;
            case 60:
                t = tile_secret
                break;
            case 9:
                t = sprite_tile_space1
                break;
            case 101:
                t = sprite_tile_spaceback1
                break;
            case 97:
                t = sprite_tile_space2
                break;
            case 77:
                t = tile_pinball1
                break;
            case 78:
                t = tile_pinball2
                break;
            case 79:
                t = tile_pinball3
                break;
            case 24:
                t = sprite_tile_war1
                break;
            case 12:
                t = sprite_tile_war2
                break;
            case 110:
                t = sprite_tile_war3
                break;
            case 5:
                t = sprite_tile_war4
                break;
            case 22:
                t = sprite_tile_war1shadow
                break;
            case 6:
                t = sprite_tile_space2shadow
                break;
            case 113:
                t = sprite_tile_citycarnival
                break;
            case 11:
                t = sprite_tile_citydark
                break;
        }

        tilemap_sprite[i] = t
        for (var yy = 0; yy < image_yscale; yy++)
        {
            for (var xx = 0; xx < image_xscale; xx++)
            {
                var _x = (x + (xx * 32))
                var _y = (y + (yy * 32))
                var data = tilemap_get_at_pixel(map_id, _x, _y)
                var _id = tile_get_index(data)
                array_push(tiles[i], [_id, _x, _y])
                data = tile_set_empty(data)
                tilemap_set_at_pixel(map_id, data, _x, _y)
            }
        }
    }
}
trace(tilemap_sprite)
if (array_length(tiles[0]) <= 0 && array_length(tiles[1]) <= 0 && array_length(tiles[2]) <= 0)
    instance_destroy()
