stepfunc = function(argument0) //anon_gml_RoomCC_freezer_13_4_Create_11_gml_RoomCC_freezer_13_4_Create
{
    if (active == 0 && place_meeting(x, y, obj_snowmanhead))
    {
        active = 1
        ds_list_add(global.saveroom, id)
    }
}

trigger = 2
