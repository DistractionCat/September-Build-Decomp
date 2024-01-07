with (other)
{
    if (state != states.ridecow && vsp > 0 && (!(place_meeting(x, yprevious, other))))
    {
        if (state == states.mort || state == states.mortjump || state == states.mortattack)
            has_mort = 1
        else
            has_mort = 0
        state = states.ridecow
        cowID = other.id
    }
    if (state != states.ridecow && state != states.stunned && cow_buffer <= 0)
    {
        state = states.stunned
        sprite_index = spr_squished
        image_index = 0
        hsp = 0
        vsp = 0
        movespeed = 0
    }
}
