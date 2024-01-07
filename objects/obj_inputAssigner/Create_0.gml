player_input_device[0] = -2
player_input_device[1] = -2
device_selected[0] = 0
device_selected[1] = 0
press_start = 0
deactivated = 0
device_to_reconnect = 0
prevstate[0] = states.titlescreen
prevstate[1] = states.titlescreen


vibration = [[0, 0, 0], [0, 0, 0]]

function setVibration(argument0, argument1, argument2, argument3) //anon_gml_Object_obj_inputAssigner_Create_0_488_gml_Object_obj_inputAssigner_Create_0
{
    vibration[argument0][0] = argument1
    vibration[argument0][1] = argument2
    if (argument3 != noone )
        vibration[argument0][2] = argument3
}

function CheckUsedIndex(argument0) //CheckUsedIndex_gml_Object_obj_inputAssigner_Create_0
{
    for (var _x = 0; _x < 2; _x++)
    {
        if (player_input_device[_x] == argument0)
            return 1;
    }
    return 0;
}

