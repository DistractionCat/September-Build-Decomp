func = function(argument0) //anon_gml_RoomCC_desert_3_5_Create_7_gml_RoomCC_desert_3_5_Create
{
    if (active == 0 && argument0.state == states.backbreaker)
    {
        active = 1
        obj_secretmanager.touchedtriggers += 1
    }
}
