if (ds_list_find_index(global.baddieroom, id) == -1)
{
    with (instance_create(x, y, obj_sausageman_dead))
        sprite_index = other.spr_dead
    ds_list_add(global.baddieroom, id)
}
