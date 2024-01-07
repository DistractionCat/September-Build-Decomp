if ((!active) && (!instance_exists(obj_frontcanongoblin)))
{
    active = 1
    start = 1
    instance_create(x, y, obj_frontcanongoblin)
    with (obj_frontcanongoblin_trigger)
        active = 1
}
else if (!start)
{
    with (obj_frontcanongoblin)
    {
        if (state != states.gameover && (!destroyed))
        {
            destroyed = 1
            state = states.gameover
            captain_sprite = spr_captainbombdead
            captain_index = 0
            alarm[0] = -1
        }
    }
}
