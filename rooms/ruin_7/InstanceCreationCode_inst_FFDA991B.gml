stepfunc = function(argument0) //anon_gml_RoomCC_ruin_7_5_Create_11_gml_RoomCC_ruin_7_5_Create
{
    if (active == 0 && place_meeting(x, y, obj_canonexplosion))
    {
        active = 1
        ds_list_add(global.saveroom, id)
    }
}

trigger = 1
