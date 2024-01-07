stepfunc = function(argument0) //anon_gml_RoomCC_minigolf_4_7_Create_11_gml_RoomCC_minigolf_4_7_Create
{
    if (active == 0 && place_meeting(x, y, obj_hamburger))
    {
        active = 1
        ds_list_add(global.saveroom, id)
    }
}

trigger = 1
