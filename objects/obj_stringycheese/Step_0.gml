targetplayer = instance_nearest(x, y, obj_player)
switch state
{
    case states.normal:
        var _dir = point_direction(x, y, targetplayer.x, targetplayer.y)
        var spd = (shootbuffer > 0 ? 3 : 10)
        var tx = targetplayer.x
        var ty = targetplayer.y
        if (point_distance(x, y, handx, handy) >= (maxhandlen - 20))
        {
            tx = (x + lengthdir_x(maxhandlen, _dir))
            ty = (y + lengthdir_y(maxhandlen, _dir))
            _dir = point_direction(x, y, tx, ty)
        }
        handx = Approach(handx, tx, spd)
        handy = Approach(handy, ty, spd)
        if (handy < y)
            handy = y
        drawhandx = lerp(drawhandx, handx, 0.5)
        drawhandy = lerp(drawhandy, handy, 0.5)
        if (shootbuffer > 0)
            shootbuffer--
        if (shootbuffer <= 0 && place_meeting(handx, handy, obj_player))
        {
            playerid = instance_place(handx, handy, obj_player)
            state = states.hook
        }
        break;
    case states.hook:
        handx = playerid.x
        handy = playerid.y
        if (handy < (y - 20))
        {
            state = states.normal
            break;
        }
        else
        {
            drawhandx = handx
            drawhandy = handy
            with (playerid)
            {
                if (y > other.y)
                {
                    var _xs = 0
                    if (x != other.x)
                        _xs = (-(sign((x - other.x))))
                    var dis = 120
                    var m = (abs((x - other.x)) > dis ? abs(hsp) : (abs(hsp) - max(0, (abs(hsp) - 2))))
                    if (hsp == 0)
                        m = _xs
                    hsp_carry = (_xs * abs(m))
                    if (y < (other.y - other.maxhandlen))
                        vsp = 20
                    if (y > (other.y + other.maxhandlen) && y > other.y)
                    {
                        other.state = states.hookshot
                        other.shootbuffer = 60
                        state = states.stringfling
                        stringid = other.id
                    }
                }
            }
            break;
        }
    case states.hookshot:
        if (shootbuffer > 0)
        {
            shootbuffer--
            handy = playerid.y
            handx = playerid.x
            drawhandx = handx
            drawhandy = handy
        }
        else
        {
            _dir = point_direction(playerid.x, playerid.y, x, y)
            var tspd = 20
            with (playerid)
            {
                var t = (x > other.x ? 40 : -40)
                if (x > (other.x - 32) && x < (other.x + 32))
                    t = 0
                hsp = lengthdir_x(tspd, (_dir + t))
                movespeed = abs(hsp)
                if (hsp != 0)
                    xscale = sign(hsp)
                dir = xscale
                vsp = (-(abs(lengthdir_y((tspd + 8), _dir))))
                state = states.stringjump
                sprite_index = spr_superspringplayer
                image_index = 0
                jumpAnim = 1
                momemtum = 1
            }
            state = states.normal
            shootbuffer = 30
        }
        break;
}

