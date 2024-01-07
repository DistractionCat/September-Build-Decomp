if (delay > 0)
    delay--
else
{
    delay = delaymax
    pos++
    if (pos >= array_length(objectlist))
        pos = 0
    with (instance_create(x, y, objectlist[pos]))
    {
        switch object_index
        {
            case obj_superspring:
                use_collision = 1
                break;
            case obj_pinballlauncher:
                use_collision = 1
                break;
        }

    }
}
