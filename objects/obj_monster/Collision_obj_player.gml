if (state == (216 << 0))
{
    if ((!global.panic) && (!instance_exists(obj_fadeout)))
    {
        other.targetDoor = targetDoor
        other.targetRoom = targetRoom
        with (instance_create(x, y, obj_fadeout))
            roomreset = 1
    }
    if (other.state != states.animatronic)
    {
        other.state = states.animatronic
        if global.panic
        {
            destroy = 0
            instance_destroy()
        }
    }
}
