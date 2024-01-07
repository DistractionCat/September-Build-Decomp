if (!active)
{
    active = 1
    sprite_index = spr_checkpoint_activating
    image_index = 0
    ds_list_add(global.saveroom, id)
    global.checkpoint_room = room
}
