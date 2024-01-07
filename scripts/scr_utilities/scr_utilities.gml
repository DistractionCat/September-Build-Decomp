function Approach(argument0, argument1, argument2) //Approach
{
    if (argument0 < argument1)
    {
        argument0 += argument2
        if (argument0 > argument1)
            return argument1;
    }
    else
    {
        argument0 -= argument2
        if (argument0 < argument1)
            return argument1;
    }
    return argument0;
}

function camera_zoom(argument0, argument1) //camera_zoom
{
    with (obj_camera)
    {
        targetzoom = argument0
        targetzoom = clamp(targetzoom, 0, max_zoom)
        if (argument1 != undefined)
            zoomspd = abs(argument1)
    }
}

function camera_set_zoom(argument0) //camera_set_zoom
{
    with (obj_camera)
        zoom = argument0
}

function try_solid(argument0, argument1, argument2, argument3) //try_solid
{
    var old_x = x
    var old_y = y
    var n = -1
    var i = 0
    while (i < argument3)
    {
        x += argument0
        y += argument1
        if (!(scr_solid(x, y)))
        {
            n = (i + 1)
            break;
        }
        else
        {
            i++
            continue
        }
    }
    x = old_x
    y = old_y
    return n;
}

function ledge_bump(argument0) //ledge_bump
{
    var old_x = x
    x += (xscale * 4)
    var ty = try_solid(0, -1, obj_solid, argument0)
    x = old_x
    if (ty != -1)
    {
        y -= ty
        x += xscale
        if scr_solid(x, y)
        {
            x = old_x
            return 1;
        }
        return 0;
    }
    return 1;
}

function instance_create_unique(argument0, argument1, argument2) //instance_create_unique
{
    if instance_exists(argument2)
        return -4;
    var b = instance_create(argument0, argument1, argument2)
    return b;
}

function get_solid_difference(argument0, argument1, argument2) //get_solid_difference
{
    var old_x = x
    var old_y = y
    var n = 0
    for (var i = 0; i < argument2; i++)
    {
        x += argument0
        y += argument1
        if (!(scr_solid(x, y)))
            n++
    }
    x = old_x
    y = old_y
    return n;
}

function trace() //trace
{
    var _string = ""
    for (var i = 0; i < argument_count; i++)
        _string += string(argument[i])
    show_debug_message(_string)
}

function concat() //concat
{
    var _string = ""
    for (var i = 0; i < argument_count; i++)
        _string += string(argument[i])
    return _string;
}

function ds_list_add_unique(argument0) //ds_list_add_unique
{
    if (argument_count > 1)
    {
        for (var i = 1; i < argument_count; i++)
        {
            var b = argument[i]
            if (ds_list_find_index(argument0, b) == -1)
                ds_list_add(argument0, b)
        }
    }
}

function point_in_camera(argument0, argument1, argument2) //point_in_camera
{
    var cam_x = camera_get_view_x(argument2)
    var cam_y = camera_get_view_y(argument2)
    var cam_w = camera_get_view_width(argument2)
    var cam_h = camera_get_view_height(argument2)
    return point_in_rectangle(argument0, argument1, cam_x, cam_y, (cam_x + cam_w), (cam_y + cam_h));
}

function point_in_camera_ext(argument0, argument1, argument2, argument3, argument4) //point_in_camera_ext
{
    var cam_x = camera_get_view_x(argument2)
    var cam_y = camera_get_view_y(argument2)
    var cam_w = camera_get_view_width(argument2)
    var cam_h = camera_get_view_height(argument2)
    return point_in_rectangle(argument0, argument1, (cam_x - argument3), (cam_y - argument4), ((cam_x + cam_w) + argument3), ((cam_y + cam_h) + argument4));
}

function bbox_in_camera(argument0, argument1) //bbox_in_camera
{
    if is_undefined(argument1)
        argument1 = 0
    var cam_x = camera_get_view_x(argument0)
    var cam_y = camera_get_view_y(argument0)
    var cam_w = camera_get_view_width(argument0)
    var cam_h = camera_get_view_height(argument0)
    return (bbox_left < ((cam_x + cam_w) + argument1) && bbox_right > (cam_x - argument1) && bbox_top < ((cam_y + cam_h) + argument1) && bbox_bottom > (cam_y - argument1));
}

