stepfunc = function(argument0) //anon_gml_RoomCC_street_jail_1_Create_11_gml_RoomCC_street_jail_1_Create
{
    if (active == 0 && place_meeting(x, y, obj_pizzaboy))
    {
        active = 1
        ds_list_add(global.saveroom, id)
    }
}

trigger = 2
