func = function(argument0) //anon_gml_RoomCC_space_6_9_Create_7_gml_RoomCC_space_6_9_Create
{
    if (active == 0 && argument0.state == states.Sjump && argument0.vsp == 20)
    {
        active = 1
        ds_list_add(global.saveroom, id)
    }
}

trigger = 1
