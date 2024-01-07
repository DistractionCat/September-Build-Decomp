if (state == (219 << 0))
{
    state = (220 << 0)
    var _found = 0
    with (obj_flush)
    {
        if (state == (219 << 0) && trigger == other.trigger)
            _found = 1
    }
    if (!_found)
    {
        with (obj_flush)
        {
            if (trigger == other.trigger)
                instance_destroy()
        }
    }
}
