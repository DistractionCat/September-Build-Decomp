switch state
{
    case (215 << 0):
        targetplayer = instance_nearest(x, y, obj_player)
        image_speed = 0.35
        sprite_index = spr_monstershroom_walk
        hsp = (image_xscale * 4)
        if (place_meeting((x + sign(hsp)), y, obj_monstersolid) && ((!(place_meeting((x + sign(hsp)), y, obj_monsterslope))) || place_meeting((x + sign(hsp)), (y - 4), obj_solid)))
            image_xscale *= -1
        scr_monster_detect_audio()
        if scr_monster_detect(300, room_height, targetplayer)
            state = (216 << 0)
        break;
    case (216 << 0):
        sprite_index = spr_monstershroom_chase
        if (x != targetplayer.x && grounded)
        {
            image_xscale = sign((targetplayer.x - x))
            if (abs((x - targetplayer.x)) > 50)
                hsp = (image_xscale * 8)
            else
                hsp = Approach(hsp, 0, 0.5)
        }
        if (targetplayer.y < (y - 250))
            vsp = -14
        if (!(point_in_camera(x, y, view_camera[0])))
            state = (218 << 0)
        break;
    case (218 << 0):
        targetplayer = instance_nearest(x, y, obj_player)
        hsp = (image_xscale * 6)
        if (place_meeting((x + sign(hsp)), y, obj_monstersolid) && ((!(place_meeting((x + sign(hsp)), y, obj_monsterslope))) || place_meeting((x + sign(hsp)), (y - 4), obj_solid)))
            state = (215 << 0)
        if scr_monster_detect(300, room_height, targetplayer)
            state = (216 << 0)
        break;
    case (217 << 0):
        scr_monsterinvestigate(10, spr_monstershroom_chase, spr_monstershroom_idle)
        break;
}

scr_monster_collide()
