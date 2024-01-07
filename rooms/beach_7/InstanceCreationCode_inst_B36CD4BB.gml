func = function(argument0) //anon_gml_RoomCC_beach_7_4_Create_7_gml_RoomCC_beach_7_4_Create
{
    if (active == 0)
    {
        if (obj_secretmanager.waittime >= 500)
        {
            active = 1
            ds_list_add(global.saveroom, id)
        }
        obj_secretmanager.waittime += 1
    }
}

trigger = 1
