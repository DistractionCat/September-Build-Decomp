var _temp_local_var_3;
function scr_collide() //scr_collide
{
    grounded = 0
    with (instance_place(x, (y + 2), obj_movingplatform))
    {
        with (other)
        {
            if (!(place_meeting(x, (y - (3 + abs(other.v_velocity))), other)))
            {
                platformid = other.id
                hsp_carry = other.hsp
                if (abs(other.vsp) > 2)
                    vsp_carry = other.vsp
            }
        }
    }
    var vsp_final = (vsp + vsp_carry)
    vsp_carry = 0
    var _temp_local_var_3 = abs(vsp_final)
    if (abs(vsp_final) <= 0)
    {
    }
    else
    {
        while (true)
        {
            if (!(scr_solid(x, (y + sign(vsp_final)))))
            {
                y += sign(vsp_final)
                var _temp_local_var_3 = (abs(vsp_final) - 1)
                if (abs(vsp_final) - 1)
                    continue
                break;
            }
            else
                vsp = 0
        }
    }
    var hsp_final = (hsp + hsp_carry)
    hsp_carry = 0
    var _temp_local_var_3 = abs(hsp_final)
    if (abs(hsp_final) <= 0)
    {
    }
    else
    {
        while (true)
        {
            if (scr_solid((x + sign(hsp_final)), y) && (!(scr_solid((x + sign(hsp_final)), (y - 1)))))
                y--
            if ((!(scr_solid((x + sign(hsp_final)), y))) && (!(scr_solid((x + sign(hsp_final)), (y + 1)))) && scr_solid((x + sign(hsp_final)), (y + 2)))
                y++
            if (!(scr_solid((x + sign(hsp_final)), y)))
            {
                x += sign(hsp_final)
                var _temp_local_var_3 = (abs(hsp_final) - 1)
                if (abs(hsp_final) - 1)
                    continue
                break;
            }
            else
                hsp = 0
        }
    }
    if (vsp < 10)
        vsp += grav
    if (platformid != noone)
    {
        if (vsp < 0 || (!instance_exists(platformid)) || (!(place_meeting(x, ((y + 12) + (abs(platformid.v_velocity) * 2)), platformid))))
        {
            platformid = noone
            y = floor(y)
        }
        else
        {
            grounded = 1
            vsp = grav
            if (platformid.vsp > 0)
                vsp = abs(platformid.v_velocity)
            y = (platformid.y - 46)
            if (!(place_meeting(x, (y + 1), platformid)))
            {
                var i = 0
                while (!(place_meeting(x, (y + 1), platformid)))
                {
                    y++
                    if (i > abs(sprite_height))
                        break;
                    else
                        continue
                }
            }
            if (platformid.v_velocity != 0)
            {
                if scr_solid(x, y)
                {
                    i = 0
                    while scr_solid(x, y)
                    {
                        y--
                        if (i > 32)
                            break;
                        else
                        {
                            i++
                            continue
                        }
                    }
                }
                if scr_solid(x, y)
                {
                    i = 0
                    while scr_solid(x, y)
                    {
                        y++
                        if (i > 64)
                            break;
                        else
                        {
                            i++
                            continue
                        }
                    }
                }
            }
        }
    }
    grounded |= scr_solid(x, (y + 1))
    grounded |= ((!(place_meeting(x, y, obj_platform))) && place_meeting(x, (y + 1), obj_platform))
    if (platformid != noone || (place_meeting(x, (y + 1), obj_movingplatform) && (!(place_meeting(x, (y - 2), obj_movingplatform)))))
        grounded = 1
}

