image_speed = 0.35
switch state
{
    case (215 << 0):
        sprite_index = spr_monstertomato_idle
        x = (camera_get_view_x(view_camera[0]) + 480)
        y = (camera_get_view_y(view_camera[0]) + ys)
        switch substate
        {
            case (135 << 0):
                ys += 2
                if (ys > 440)
                {
                    var pid = scr_puppet_detect()
                    trace(pid)
                    if (pid != noone)
                    {
                        playerid = pid
                        substate = (141 << 0)
                    }
                    else
                        substate = states.jump
                }
                break;
            case states.jump:
                ys -= 3
                if (ys < -100)
                {
                    destroy = 0
                    with (obj_monstertrackingrooms)
                    {
                        sound_buffer = sfx_jump
                        monster_pos[other.monsterid].x = last_puppet_pos.x
                        monster_pos[other.monsterid].y = last_puppet_pos.y
                    }
                    instance_destroy()
                }
                break;
            case (141 << 0):
                ys -= 10
                if (ys < -100)
                    scr_puppet_appear(playerid)
                break;
        }

        break;
    case (216 << 0):
        switch substate
        {
            case (135 << 0):
                sprite_index = spr_monstertomato_chase
                if (grounded && vsp > 0)
                    substate = (141 << 0)
                scr_collision()
                break;
            case (141 << 0):
                sprite_index = spr_monstertomato_chase
                var dir = point_direction(x, y, playerid.x, playerid.y)
                x += lengthdir_x(6, dir)
                y += lengthdir_y(6, dir)
                if (x != playerid.x)
                    image_xscale = sign((playerid.x - x))
                break;
        }

        break;
}

depth = (state == (215 << 0) ? 100 : -6)
