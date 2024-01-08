
if (ds_list_find_index(global.baddieroom, id) != -1)
    instance_destroy()
if (escape == 1 && global.panic == 0)
    instance_deactivate_object(id)
