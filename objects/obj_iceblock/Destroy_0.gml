if (ds_list_find_index(global.saveroom, id) == -1)
{
    repeat (6)
        create_debris((x + 32), (y + 32), spr_icedebris)
    instance_create((x + 32), (y + 32), obj_parryeffect)
    ds_list_add(global.saveroom, id)
}
