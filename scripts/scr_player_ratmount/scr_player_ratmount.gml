function scr_player_ratmount() //scr_player_ratmount
{
    move = (key_left + key_right)
    hsp = (xscale * movespeed)
    doublejump = 0
    if (ratgrabbedID != noone && (!instance_exists(ratgrabbedID)))
        ratgrabbedID = noone
    if key_jump
        input_buffer_jump = 0
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
        if (movespeed >= ratmount_movespeed && move == xscale && key_down && (!(place_meeting((x + sign(hsp)), y, obj_solid))) && (!(scr_solid_slope((x + sign(hsp)), y))))
            state = states.ratmounttumble
        if (movespeed < 3 && move != 0)
            image_speed = 0.35
        else if (movespeed > 3 && movespeed < 6)
            image_speed = 0.45
        else
            image_speed = 0.6
    }
    else
        movespeed = Approach(movespeed, 0, 0.5)
    if (movespeed > ratmount_movespeed)
        movespeed -= 0.1
    if (!landAnim)
    {
        if (hsp != 0)
            sprite_index = spr_player_ratmountmove
        else
        {
            image_speed = 0.35
            if (sprite_index != spr_player_ratmountidleanim)
            {
                sprite_index = spr_player_ratmountidle
                if (ratgrabbedID == noone)
                {
                    if (idle < 400)
                        idle++
                    if (idle >= 150)
                    {
                        sprite_index = spr_player_ratmountidleanim
                        image_index = 0
                    }
                }
            }
            else if (floor(image_index) == (image_number - 1))
            {
                idle = 0
                sprite_index = spr_player_ratmountidle
            }
        }
        if (ratgrabbedID != noone)
        {
            image_speed = 0.35
            if (sprite_index == spr_player_ratmountidle)
                sprite_index = spr_player_ratmountidle2
            else if (sprite_index == spr_player_ratmountmove)
                sprite_index = spr_player_ratmountmove2
        }
    }
    else if (floor(image_index) == (image_number - 1))
    {
        landAnim = 0
        if (sprite_index == spr_player_ratmountland)
            sprite_index = spr_player_ratmountidle
    }
    if (sprite_index == spr_player_ratmountland)
        image_speed = 0.35
    if (hsp != 0 && (!steppy) && floor(image_index) == 7)
    {
        steppy = 1
        create_particle(x, (y + 38), (1 << 0), 0)
    }
    if (hsp != 0 && floor(image_index) != 7)
        steppy = 0
    if (input_buffer_jump < 8 && grounded)
    {
        particle_set_scale((4 << 0), xscale, 1)
        create_particle(x, y, (4 << 0), 0)
        scr_soundeffect(sfx_jump)
        sprite_index = spr_player_ratmountjump
        image_index = 0
        if (ratgrabbedID != noone)
            sprite_index = spr_player_ratmountjump2
        jumpAnim = 1
        state = states.ratmountjump
        vsp = -11
        jumpstop = 0
    }
    if (!grounded)
    {
        state = states.ratmountjump
        jumpAnim = 0
        sprite_index = spr_player_ratmountfall
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
    if (key_attack && grounded)
    {
        state = states.ratmountbounce
        sprite_index = spr_player_ratmountbounce
        image_index = 0
        hsp = 0
        vsp = 0
        movespeed = 5
        tauntstoredvsp = -8
        ratmount_fallingspeed = 0
    }
    with (ratgrabbedID)
        scr_enemy_ratgrabbed()
    ratmount_dotaunt()
}

function ratmount_dotaunt() //ratmount_dotaunt
{
    if (key_taunt2 && state != states.backbreaker)
    {
        scr_soundeffect(sfx_taunt)
        tauntstoredisgustavo = 1
        taunttimer = 20
        tauntstoredmovespeed = movespeed
        tauntstoredsprite = sprite_index
        tauntstoredstate = state
        tauntstoredvsp = vsp
        state = states.backbreaker
        sprite_index = spr_player_ratmounttaunt
        with (instance_create(x, y, obj_taunteffect))
            player = other.id
    }
}

