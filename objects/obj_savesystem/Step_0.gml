if (room == hub_loadingscreen && state != states.dynamite && (!instance_exists(obj_fadeout)))
{
    with (obj_player)
    {
        targetRoom = hub_reception
        targetDoor = "D"
    }
    instance_create(x, y, obj_fadeout)
}
if (state != states.normal)
{
    showicon = 1
    icon_alpha = 3
}
else if showicon
{
    icon_alpha = Approach(icon_alpha, 0, 0.05)
    if (icon_alpha <= 0)
        showicon = 0
}
if showicon
{
    icon_index += 0.35
    if (icon_index > (icon_max - 1))
    {
        var t = frac(icon_index)
        icon_index = t
    }
}
