for (var i = 0; i < array_length(objectlist); i++)
{
    var b = objectlist[i]
    if (global.panic == 0)
    {
        with (instance_place(x, y, b))
            instance_destroy()
    }
}
