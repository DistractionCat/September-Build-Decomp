pal_swap_init_system(shd_pal_swapper)
global.roommessage = "PIZZA TOWER IN YE OLDE TIME"
if (!obj_secretmanager.init)
{
    obj_secretmanager.init = 1
    secret_add(-4, function() //anon_gml_Room_medieval_1_Create_261_gml_Room_medieval_1_Create
    {
        if secret_check_trigger(0)
            secret_open_portal(0)
        else
            secret_close_portal(0)
    }
)
    secret_add(-4, function() //anon_gml_Room_medieval_1_Create_440_gml_Room_medieval_1_Create
    {
        secret_open_portal(1)
    }
)
    secret_add(-4, function() //anon_gml_Room_medieval_1_Create_536_gml_Room_medieval_1_Create
    {
        secret_open_portal(2)
    }
)
}
