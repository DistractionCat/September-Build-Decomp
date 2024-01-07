if (room == rm_editor)
    return;
if (ds_list_find_index(global.saveroom, id) == -1 && global.snickchallenge == 0)
{
    repeat (6)
    {
        with (create_debris((x + 16), y, sprite_index))
        {
            if (sprite_index == spr_destroyable2)
                sprite_index = spr_debris
            else
                sprite_index = spr_halloweendebris
        }
    }
    with (instance_create((x + 16), (y + 16), obj_parryeffect))
        sprite_index = spr_pizzablockdead
    scr_sleep(5)
    create_baddiegibsticks((x + 16), (y + 16))
    instance_create(x, y, obj_collect)
    tile_layer_delete_at(1, x, y)
    if (audio_is_playing(sfx_breakblock1) || audio_is_playing(sfx_breakblock2))
    {
        audio_stop_sound(sfx_breakblock1)
        audio_stop_sound(sfx_breakblock2)
    }
    scr_soundeffect(sfx_breakblock1, sfx_breakblock2)
    ds_list_add(global.saveroom, id)
}
