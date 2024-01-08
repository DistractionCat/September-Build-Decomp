switch state
{
    case states.normal:
        targetplayer = instance_nearest(x, y, obj_player)
        if (targetplayer.x > (x - 200) && targetplayer.x < (x + 200) && targetplayer.y > y && targetplayer.y < (y + 500))
        {
            state = states.transitioncutscene
            sprite_index = spr_grabbiehand_hifive
            image_index = 0
            shootdir = point_direction(x, y, targetplayer.x, targetplayer.y)
        }
        grounded = 0
        break;
    case states.transitioncutscene:
        if (floor(image_index) == (image_number - 1))
        {
            state = (135 << 0)
            sprite_index = spr_grabbiehand_fall
        }
        break;
    case (135 << 0):
        var spd = 12
        shootdir = angle_rotate(shootdir, point_direction(x, y, targetplayer.x, targetplayer.y), turnspeed)
        hsp = lengthdir_x(spd, shootdir)
        vsp = lengthdir_y(spd, shootdir)
        if (hsp != 0)
            image_xscale = sign(hsp)
        if grounded
        {
            state = states.stun
            stunned = 50
            hsp = 0
            vsp = 0
            sprite_index = spr_grabbiehand_catch
        }
        scr_collide()
        break;
    case states.stun:
        if (stunned > 0)
            stunned--
        else if grounded
        {
            state = states.ejected
            sprite_index = spr_grabbiehand_idle
            grounded = 0
        }
        if grounded
            hsp = 0
        scr_collide()
        break;
    case states.ejected:
        var _dir = point_direction(x, y, xstart, ystart)
        x = Approach(x, xstart, abs(lengthdir_x(8, _dir)))
        y = Approach(y, ystart, abs(lengthdir_y(8, _dir)))
        if (x > (xstart - 8) && x < (xstart + 8) && y > (ystart - 8) && y < (ystart + 8))
        {
            state = states.normal
            x = xstart
            y = ystart
        }
        break;
    case states.grabbing:
        sprite_index = spr_grabbiehand_catch
        vsp = -6
        move = (playerid.key_left + playerid.key_right)
        hsp = (move * 4)
        if (move != 0)
            image_xscale = sign(move)
        with (playerid)
        {
            hsp = 0
            vsp = 0
            x = other.x
            y = other.y
            xscale = other.image_xscale
            state = states.bump
            sprite_index = spr_player_catched
        }
        if scr_solid(x, (y - 1))
        {
            sprite_index = spr_grabbiehand_idle
            state = states.ejected
            if fake
                instance_destroy()
        }
        scr_collide()
        break;
}

