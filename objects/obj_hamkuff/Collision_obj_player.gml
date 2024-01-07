if (state != states.stun)
{
    if (other.state != states.mach3 || (!other.launched))
    {
        if (state != states.blockstance)
        {
            state = states.blockstance
            playerid = other.id
        }
    }
    else
        instance_destroy()
}
