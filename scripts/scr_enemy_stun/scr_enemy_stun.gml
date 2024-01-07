function scr_enemy_stun() //scr_enemy_stun
{
    if (global.attackstyle != 2)
    {
        switch hp
        {
            case -1:
                grav = 1.1
                break;
            case -2:
                grav = 1.3
                break;
        }

    }
    if (object_index == obj_ninja)
        attack = 1
    switch global.stylethreshold
    {
        case 0:
            stunned -= 0.5
            break;
        case 1:
            stunned -= 0.65
            break;
        case 2:
            stunned -= 0.8
            break;
        case 3:
            stunned -= 1
    }

    if (stuntouchbuffer > 0)
        stuntouchbuffer--
    if (sprite_index != spr_tank_hitwall)
        sprite_index = stunfallspr
    else if (floor(image_index) == (image_number - 1) && sprite_index == spr_tank_hitwall)
    {
        state = states.walk
        stunned = 0
        sprite_index = spr_tank_walk
    }
    image_speed = 0.35
    if ((grounded || (grounded && (!(place_meeting(x, y, obj_platform))))) && vsp > 0 && (!(place_meeting((x + hsp), y, obj_destructibles))))
    {
        if (thrown == 1 && destroyable)
            instance_destroy()
        hsp = 0
        thrown = 0
    }
    if (hitvsp < 0 && place_meeting(x, (y - 1), obj_solid) && (!(place_meeting(x, (y - 1), obj_destructibles))))
    {
        if (thrown == 1 && destroyable)
            instance_destroy()
        thrown = 0
    }
    if (hithsp != 0 && place_meeting((x - image_xscale), y, obj_solid) && (!(place_meeting((x - image_xscale), y, obj_destructibles))))
    {
        particle_set_scale((8 << 0), (-image_xscale), 1)
        create_particle(x, y, (8 << 0), 0)
        if (thrown == 1 && destroyable)
            instance_destroy()
        thrown = 0
    }
    if (stunned <= 0 && grounded)
    {
        vsp = 0
        image_index = 0
        sprite_index = walkspr
        state = states.walk
    }
    if place_meeting(x, (y + 1), obj_railparent)
    {
        var _railinst = instance_place(x, (y + 1), obj_railparent)
        hsp += (_railinst.movespeed * _railinst.dir)
    }
    if (thrown && (!global.kungfu) && global.attackstyle != 2)
    {
        grav = 0
        if (!instance_exists(chargeID))
        {
            with (instance_create(x, y, obj_chargeenemyhitbox))
            {
                baddieID = other.id
                other.chargeID = id
            }
        }
    }
    if (!thrown)
        grav = 0.5
}

