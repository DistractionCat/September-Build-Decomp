if ((!start) && ds_list_find_index(global.saveroom, id) == -1)
{
    start = 1
    with (obj_horsey)
    {
        hsp = (other.hsp * other.spd)
        vsp = (other.vsp * other.spd)
        spd = other.spd
    }
    with (obj_raceend)
        start = 1
    global.horse = 1
}
