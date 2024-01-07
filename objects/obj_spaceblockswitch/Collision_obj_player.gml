if (other.state == states.handstandjump || other.state == states.lungeattack)
{
    global.spaceblockswitch = (!global.spaceblockswitch)
    if (sprite_index == spr_switchblock_happy || (sprite_index == spr_switchblock_gohappy && image_index > 0))
    {
        sprite_index = spr_switchblock_gosad
        image_index = 0
    }
    if (sprite_index == spr_switchblock_sad || (sprite_index == spr_switchblock_gosad && image_index > 0))
    {
        sprite_index = spr_switchblock_gohappy
        image_index = 0
    }
    with (other)
        scr_pummel()
}
