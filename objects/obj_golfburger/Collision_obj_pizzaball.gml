if (state != states.throwing && state != states.stun && state != states.grabbed)
{
    if (other.hsp == 0 && other.vsp > 0 && other.vsp < 1)
    {
        golfid = other.id
        shot = 0
        state = states.throwing
        sprite_index = spr_cheeseslime_rage
        image_index = 0
    }
    else if (!other.grounded)
        instance_destroy()
}
