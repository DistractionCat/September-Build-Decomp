function scr_player_ratmountjump() //scr_player_ratmountjump
{
    move = (key_left + key_right)
    hsp = (xscale * movespeed)
    image_speed = 0.35
    if key_jump
        input_buffer_jump = 0
    if ((!jumpstop) && vsp < 0.5 && (!key_jump2))
    {
        vsp /= 10
        jumpstop = 1
    }
    if (move != 0)
    {
        if (move == xscale)
        {
            if (movespeed < ratmount_movespeed)
                movespeed += 0.5
            else if (floor(movespeed) == ratmount_movespeed)
                movespeed = ratmount_movespeed
        }
        else
        {
            movespeed = Approach(movespeed, 0, 1)
            if (movespeed <= 0)
                xscale = move
        }
    }
    else
        movespeed = Approach(movespeed, 0, 0.5)
    if (movespeed > ratmount_movespeed)
        movespeed -= 0.1
    if (jumpAnim && floor(image_index) == (image_number - 1))
    {
        jumpAnim = 0
        if (sprite_index == spr_player_ratmountjump)
            sprite_index = spr_player_ratmountfall
        else if (sprite_index == spr_player_ratmountjump2)
            sprite_index = spr_player_ratmountfall2
    }
    if (grounded && vsp > 0)
    {
        doublejump = 0
        create_particle(x, y, (12 << 0), 0)
        state = states.ratmount
        landAnim = 1
        jumpstop = 0
        sprite_index = spr_player_ratmountland
        image_index = 0
        if (ratgrabbedID != noone)
        {
            landAnim = 0
            sprite_index = spr_player_ratmountidle2
        }
    }
    if key_slap2
    {
        if (ratgrabbedID != noone)
        {
            state = states.ratmountspit
            sprite_index = spr_player_ratmountspit
            image_index = 0
        }
        else
        {
            state = states.ratmountattack
            movespeed = 10
            sprite_index = spr_player_ratmountattack
            image_index = 0
        }
    }
    if key_down
    {
        state = states.ratmountgroundpound
        vsp = -10
        hsp = 0
        movespeed = 0
        sprite_index = spr_player_ratmountgroundpound
        image_index = 0
        image_speed = 0.35
        with (instance_create(x, y, obj_ratmountgroundpound))
        {
            image_xscale = other.xscale
            vsp = 20
        }
    }
    with (ratgrabbedID)
        scr_enemy_ratgrabbed()
    ratmount_dotaunt()
}

