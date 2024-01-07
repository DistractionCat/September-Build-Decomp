with (other)
{
    var b = 1
    for (i = 0; i < array_length(transformation); i += 1)
    {
        if (state == transformation[i])
            b = 0
    }
    if (b == 1)
    {
        scr_losepoints()
        sprite_index = spr_slipbanan1
        other.drop = 1
        vsp = -11
        image_index = 0
        state = states.slipbanan
        instance_destroy(other)
    }
}
