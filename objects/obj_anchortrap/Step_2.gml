switch state
{
    case states.normal:
        hsp = 0
        vsp = 0
        break;
    case (135 << 0):
        var num = instance_place_list(x, ((y + vsp) + 1), obj_destructibles, global.instancelist, false)
        for (var i = 0; i < num; i++)
            instance_destroy(ds_list_find_value(global.instancelist, i))
        ds_list_clear(global.instancelist)
        instance_destroy(instance_place(x, ((y + vsp) + 1), obj_metalblock))
        scr_collision()
        if grounded
        {
            scr_soundeffect(sfx_groundpound)
            state = states.jump
            with (obj_camera)
            {
                shake_mag = 5
                shake_mag_acc = (3 / room_speed)
            }
        }
        break;
    case states.jump:
        y = Approach(y, ystart, 2)
        if (y == ystart)
            state = states.normal
        break;
}

