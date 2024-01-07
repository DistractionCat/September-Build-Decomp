if (room == rm_editor)
    return;
if (ds_list_find_index(global.saveroom, id) == -1 && global.snickchallenge == 0)
{
    scr_sleep(5)
    with (instance_create((x + 32), (y + 32), obj_parryeffect))
        sprite_index = spr_bigpizzablockdead
    if (content == obj_null)
    {
        repeat (2)
        {
            with (instance_create((x + 32), (y + 32), obj_pizzaslice))
            {
                hsp = 2
                if ((obj_player1.character == "N" && obj_player1.spotlight == 1) || (obj_player2.character == "N" && obj_player1.spotlight == 0))
                    sprite_index = spr_halloweenspinningpizza
                else
                    sprite_index = spr_pizzaslice
            }
        }
    }
    else
        instance_create((x + 32), y, content)
    repeat (3)
        create_baddiegibsticks((x + 32), (y + 32))
    tile_layer_delete_at(1, x, y)
    tile_layer_delete_at(1, (x + 32), y)
    tile_layer_delete_at(1, (x + 32), (y + 32))
    tile_layer_delete_at(1, x, (y + 32))
    if (audio_is_playing(sfx_breakblock1) || audio_is_playing(sfx_breakblock2))
    {
        audio_stop_sound(sfx_breakblock1)
        audio_stop_sound(sfx_breakblock2)
    }
    scr_soundeffect(sfx_breakblock1, sfx_breakblock2)
    ds_list_add(global.saveroom, id)
}
