func = function(argument0) //anon_gml_RoomCC_rm_testing_14_Create_7_gml_RoomCC_rm_testing_14_Create
{
    if ((!active) && argument0.state == states.backbreaker)
    {
        active = 1
        obj_secretmanager.totems++
    }
}

stepfunc = function() //anon_gml_RoomCC_rm_testing_14_Create_151_gml_RoomCC_rm_testing_14_Create
{
    if active
    {
        with (instance_place(x, y, obj_totem))
            sprite_index = spr_totemcheese_pep
    }
}

visible = false
