if (!instance_exists(obj_option))
{
    scr_getinput()
    var _m = (key_down2 - key_up2)
    selected_world += _m
    selected_world = clamp(selected_world, 0, (array_length(level_array) - 1))
    if (_m != 0)
        selected_level = 0
    selected_level += (key_left2 + key_right2)
    selected_level = clamp(selected_level, 0, (array_length(level_array[selected_world]) - 1))
    if (!active)
        return;
    if (key_jump2 && (!instance_exists(obj_fadeout)))
    {
        var _levelinfo = level_array[selected_world][selected_level]
        with (obj_player)
        {
            state = states.comingoutdoor
            targetRoom = _levelinfo[1]
            targetDoor = "A"
            instance_create(x, y, obj_fadeout)
        }
    }
}
