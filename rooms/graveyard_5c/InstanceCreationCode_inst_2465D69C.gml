func = function(argument0) //anon_gml_RoomCC_graveyard_5c_7_Create_7_gml_RoomCC_graveyard_5c_7_Create
{
    if (active == 0 && argument0.state == states.ghostpossess)
    {
        active = 1
        ds_list_add(global.saveroom, id)
    }
}

